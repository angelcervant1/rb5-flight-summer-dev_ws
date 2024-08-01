#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <iostream>
#include <ncurses.h>


class TeleopDrone
{
public:
    TeleopDrone()
    {
        cmd_vel_pub_ = nh.advertise<geometry_msgs::Twist>("mavros/setpoint_velocity/cmd_vel", 10);
        state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, &TeleopDrone::state_cb, this);
        local_pos_pub = nh.advertise<geometry_msgs::PoseStamped> ("mavros/setpoint_position/local", 10);
        arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
        set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
        startControlLoop();
    }

private:

    mavros_msgs::State current_state;
    ros::Subscriber state_sub;
    ros::Publisher local_pos_pub;
    ros::ServiceClient set_mode_client; 
    ros::ServiceClient arming_client; 
    ros::NodeHandle nh;
    ros::Publisher cmd_vel_pub_;
    ros::Time last_request = ros::Time::now();
    
    void state_cb(const mavros_msgs::State::ConstPtr& msg){
        current_state = *msg;
    }
    
    bool setOffboardMode(){

        mavros_msgs::SetMode offb_set_mode;
        offb_set_mode.request.custom_mode = "OFFBOARD";

        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = true;

        while(ros::ok()){
            if(current_state.mode != "OFFBOARD" &&
                (ros::Time::now() - last_request > ros::Duration(5.0))){
                if( set_mode_client.call(offb_set_mode) &&
                    offb_set_mode.response.mode_sent){
                    ROS_INFO("Offboard enabled");
                }
                last_request = ros::Time::now();
            } else {
                if( !current_state.armed &&
                    (ros::Time::now() - last_request > ros::Duration(5.0))){
                    if( arming_client.call(arm_cmd) &&
                        arm_cmd.response.success){
                        ROS_INFO("Vehicle armed");
                        return true;
                    }
                    last_request = ros::Time::now();
                }
            }
            ros::spinOnce();
        }
        return false;
    }

    void startControlLoop()
    {        
        if(!setOffboardMode()){
            ROS_ERROR("Failed to set OFFBOARD Mode...");
            return;
        }

        initscr();
        timeout(100); // 100 ms timeout for getch()
        cbreak();
        noecho();
        
        geometry_msgs::Twist cmd_vel;
        std::cout << "Enter command (w/s/a/d/r/f/u/j): " << std::endl;
        
        while (ros::ok())   
        {
            int ch = getch();
            bool publish_zero = false;            

            switch (ch)
            {
                case 'w': cmd_vel.linear.x = 1.0; break;   // Move forward
                case 's': cmd_vel.linear.x = -1.0; break;  // Move backward
                case 'a': cmd_vel.linear.y = 1.0; break;   // Move left
                case 'd': cmd_vel.linear.y = -1.0; break;  // Move right
                case 'r': cmd_vel.angular.z = 1.0; break;   // Rotate clockwise
                case 'f': cmd_vel.angular.z = -1.0; break;  // Rotate counter-clockwise
                case 'u': cmd_vel.linear.z = 1.0; break;   // Move up
                case 'j': cmd_vel.linear.z = -1.0; break;  // Move down
                case ERR: publish_zero = true; break;
                default: break; ROS_WARN( "Invalid key" );
            }

            if (publish_zero){
                cmd_vel.linear.x = 0;
                cmd_vel.linear.y = 0;
                cmd_vel.linear.z = 0;
                cmd_vel.angular.z = 0;;
            }

            cmd_vel_pub_.publish(cmd_vel);
            ros::spinOnce();
        }
        endwin();
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "ros_teleop_node");
    TeleopDrone teleop;
    return 0;
}
