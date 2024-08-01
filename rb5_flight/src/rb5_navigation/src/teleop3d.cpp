#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <iostream>
#include <ncurses.h>
#include <csignal>

class TeleopDrone
{
public:
    TeleopDrone()
    {
        teleop_instance = this;  // Set the global instance pointer
        signal(SIGINT, signalHandler);  // Register the static signal handler

        cmd_vel_pub_ = nh.advertise<geometry_msgs::Twist>("mavros/setpoint_velocity/cmd_vel_unstamped", 10);
        state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, &TeleopDrone::state_cb, this);
        local_pos_pub = nh.advertise<geometry_msgs::PoseStamped> ("mavros/setpoint_position/local", 10);
        arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
        set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");
        startControlLoop();
    }

    void disarmAndExit() {
        ROS_INFO("Disarming and exiting...");
        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = false;
        arming_client.call(arm_cmd);
        ROS_INFO("Vehicle disarmed.");
    }

private:
    static TeleopDrone* teleop_instance; // Static pointer to instance
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
    
    bool setOffboardMode() {
        ROS_INFO("Trying to set OFFBOARD mode...");

        mavros_msgs::SetMode offb_set_mode;
        offb_set_mode.request.custom_mode = "OFFBOARD";

        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = true;

        ros::Time start_time = ros::Time::now();
        ros::Duration timeout_duration(30.0); // Timeout duration

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
            }

            ros::spinOnce();
            ros::Duration(0.1).sleep(); // Sleep to prevent high CPU usage
        }
        return false;
    }

    void startControlLoop() {        
        if(!setOffboardMode()){
            ROS_ERROR("Failed to set OFFBOARD Mode...");
            return;
        }

        initscr();
        timeout(100); // 100 ms timeout for getch()
        cbreak();
        noecho();
        
        geometry_msgs::Twist cmd_vel;
        ROS_INFO("Enter command (w/s/a/d/r/f/u/j): ");
        
        while (ros::ok())   
        {
            int ch = getch();
            bool publish_zero = false;            

            switch (ch)
            {
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

            if (publish_zero){
                cmd_vel.linear.x = 0;
                cmd_vel.linear.y = 0;
                cmd_vel.linear.z = 0;
                cmd_vel.angular.z = 0;
            }

            cmd_vel_pub_.publish(cmd_vel);
            // ROS_INFO("Publishing command: linear(%f, %f, %f) angular(%f)",
            // cmd_vel.linear.x, cmd_vel.linear.y, cmd_vel.linear.z,
            // cmd_vel.angular.z);
            ros::spinOnce();
        }
        endwin();
    }

    // Static signal handler
    static void signalHandler(int signum) {
        if (teleop_instance) {
            teleop_instance->disarmAndExit();
        }
        ros::shutdown();
        exit(signum);
    }
};

// Initialize static member
TeleopDrone* TeleopDrone::teleop_instance = nullptr;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "ros_teleop_node");
    TeleopDrone teleop;
    ros::spin(); // Ensure that ROS keeps running
    return 0;
}
