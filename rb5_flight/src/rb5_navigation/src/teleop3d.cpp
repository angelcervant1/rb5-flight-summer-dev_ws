#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <iostream>
#include <ncurses.h>
#include <signal.h>

class TeleopDrone
{
public:
    TeleopDrone() : rate(20.0)  // Initialize rate to 20 Hz
    {
        teleop_instance = this;  
        signal(SIGINT, signalHandler);  

        cmd_vel_pub_ = nh.advertise<geometry_msgs::Twist>("mavros/setpoint_velocity/cmd_vel_unstamped", 10);
        state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, &TeleopDrone::state_cb, this);
        local_pos_pub = nh.advertise<geometry_msgs::PoseStamped> ("mavros/setpoint_position/local", 10);
        arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
        set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
        takeoff();
        startControlLoop();
    }

    void disarmAndExit() {
        mavros_msgs::SetMode land_set_mode;
        land_set_mode.request.custom_mode = "AUTO.LAND";
        ROS_INFO("Sending land command...");
        if (set_mode_client.call(land_set_mode) && land_set_mode.response.mode_sent) {
            ROS_INFO("Land call received!");
        } else {
            ROS_WARN("Failed to send land command!");
        }
        ros::shutdown();
    }

private:
    static TeleopDrone* teleop_instance;
    mavros_msgs::State current_state;
    ros::Subscriber state_sub;
    ros::Publisher local_pos_pub;
    ros::ServiceClient set_mode_client; 
    ros::ServiceClient arming_client; 
    ros::NodeHandle nh;
    ros::Publisher cmd_vel_pub_;
    ros::Time last_request = ros::Time::now();
    ros::Time start_time;
    ros::Duration dt;
    bool teleop_enable = false;
    ros::Rate rate;  // Declare ros::Rate object

    void state_cb(const mavros_msgs::State::ConstPtr& msg){
        current_state = *msg;
    }   

    void takeoff() {
        while (ros::ok() && !current_state.connected) {
            ros::spinOnce();
            rate.sleep();
        }

        geometry_msgs::PoseStamped pose;
        pose.header.frame_id = "map";
        pose.pose.position.x = 0;
        pose.pose.position.y = 0;
        pose.pose.position.z = 2.0;


        mavros_msgs::SetMode offb_set_mode;
        offb_set_mode.request.custom_mode = "OFFBOARD";

        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = true;

        ros::Time last_request = ros::Time::now();

        while (ros::ok()) {
            if (current_state.mode != "OFFBOARD" &&
                (ros::Time::now() - last_request > ros::Duration(5.0))) {
                if (set_mode_client.call(offb_set_mode) &&
                    offb_set_mode.response.mode_sent) {
                    ROS_INFO("Offboard enabled");
                }
                last_request = ros::Time::now();
            } else {
                if (!current_state.armed &&
                    (ros::Time::now() - last_request > ros::Duration(5.0))) {
                    if (arming_client.call(arm_cmd) &&
                        arm_cmd.response.success) {
                        ROS_INFO("Vehicle armed");
                    }
                    last_request = ros::Time::now();
                }
            }
            pose.header.stamp = ros::Time::now();
            local_pos_pub.publish(pose);

            // 10 seconds till the teleop node overrides the takeoff routine
            if (ros::Time::now() - last_request > ros::Duration(8.0)) {
                teleop_enable = true;
                return;
            }

            ros::spinOnce();
            rate.sleep();
        }
    }

    bool setOffboardMode() {
        ROS_INFO("Trying to set OFFBOARD mode...");

        mavros_msgs::SetMode offb_set_mode;
        offb_set_mode.request.custom_mode = "OFFBOARD";

        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = true;

        start_time = ros::Time::now();
        ros::Duration timeout_duration(30.0);

        while (ros::ok()) {
            if (ros::Time::now() - start_time > timeout_duration) {
                ROS_ERROR("Timeout while setting OFFBOARD mode or arming.");
                return false;
            }

            if (current_state.mode != "OFFBOARD" &&
                (ros::Time::now() - last_request > ros::Duration(5.0))) {
                if (set_mode_client.call(offb_set_mode) &&
                    offb_set_mode.response.mode_sent) {
                    ROS_INFO("Offboard mode enabled.");
                } else {
                    ROS_WARN("Failed to set OFFBOARD mode.");
                }
                last_request = ros::Time::now();
            } else if (!current_state.armed &&
                       (ros::Time::now() - last_request > ros::Duration(5.0))) {
                if (arming_client.call(arm_cmd) &&
                    arm_cmd.response.success) {
                    ROS_INFO("Vehicle armed.");
                    return true;
                } else {
                    ROS_WARN("Failed to arm vehicle.");
                }
                last_request = ros::Time::now();
            } else {
                ROS_INFO("OFFBOARD mode and armed state confirmed.");
                return true;
            }

            ros::spinOnce();
            rate.sleep();

        }
        return false;
    }

    void startControlLoop() {        
        if (!setOffboardMode()) {
            ROS_ERROR("Failed to set OFFBOARD Mode...");
            return;
        }
        
        ROS_INFO("Enter command (w/s/a/d/r/f/u/j): ");
        initscr();
        timeout(100); 
        cbreak();
        noecho(); 
        
        geometry_msgs::Twist cmd_vel;
        while (ros::ok()) {
            int ch = getch();
            bool publish_zero = false;           

            switch (ch) {
                case 'w': cmd_vel.linear.x = 0.5; break;   // Move forward
                case 's': cmd_vel.linear.x = -0.5; break;  // Move backward
                case 'a': cmd_vel.linear.y = 0.5; break;   // Move left
                case 'd': cmd_vel.linear.y = -0.5; break;  // Move right
                case 'r': cmd_vel.angular.z = 0.5; break;   // Rotate clockwise
                case 'f': cmd_vel.angular.z = -0.5; break;  // Rotate counter-clockwise
                case 'u': cmd_vel.linear.z = 0.5; break;   // Move up
                case 'j': cmd_vel.linear.z = -0.5; break;  // Move down
                case ERR: publish_zero = true; break;
                default: break; ROS_WARN("Invalid key");
            }

            if (publish_zero) {
                cmd_vel.linear.x = 0;
                cmd_vel.linear.y = 0;
                cmd_vel.linear.z = 0;
                cmd_vel.angular.z = 0;
            }

            cmd_vel_pub_.publish(cmd_vel);
            ros::spinOnce();
            rate.sleep();
        }
        endwin();
    }

    static void signalHandler(int signum) {
        if (teleop_instance) {
            teleop_instance->disarmAndExit();
        }
        endwin();
        ros::shutdown();
        exit(signum);
    }
};


TeleopDrone* TeleopDrone::teleop_instance = nullptr;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "teleop_ros_node");
    TeleopDrone teleop;
    ros::spin(); 
    return 0;
}
