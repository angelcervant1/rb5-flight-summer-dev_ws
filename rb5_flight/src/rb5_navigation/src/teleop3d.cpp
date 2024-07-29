#include <ros/ros.h>
#include <geometry_msgs/TwistStamped.h>
#include <iostream>

class TeleopDrone
{
public:
    TeleopDrone()
    {
        cmd_vel_pub_ = nh_.advertise<geometry_msgs::TwistStamped>("mavros/setpoint_velocity/cmd_vel", 10);
        startControlLoop();
    }

private:
    ros::NodeHandle nh_;
    ros::Publisher cmd_vel_pub_;

    void startControlLoop()
    {
        char key;
        geometry_msgs::TwistStamped cmd_vel;

        while (ros::ok())
        {
            std::cout << "Enter command (w/s/a/d/r/f/u/j): ";
            std::cin >> key;

            switch (key)
            {
                case 'w': cmd_vel.twist.linear.x = 1.0; break;   // Move forward
                case 's': cmd_vel.twist.linear.x = -1.0; break;  // Move backward
                case 'a': cmd_vel.twist.linear.y = 1.0; break;   // Move left
                case 'd': cmd_vel.twist.linear.y = -1.0; break;  // Move right
                case 'r': cmd_vel.twist.angular.z = 1.0; break;   // Rotate clockwise
                case 'f': cmd_vel.twist.angular.z = -1.0; break;  // Rotate counter-clockwise
                case 'u': cmd_vel.twist.linear.z = 1.0; break;   // Move up
                case 'j': cmd_vel.twist.linear.z = -1.0; break;  // Move down
                default: std::cout << "Invalid key. Use 'w', 's', 'a', 'd', 'r', 'f', 'u', or 'j'." << std::endl;
            }
            cmd_vel.header.stamp = ros::Time::now();
            cmd_vel.header.frame_id = "odom";
            cmd_vel_pub_.publish(cmd_vel);
            ros::spinOnce();
        }
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "custom_teleop_node");
    TeleopDrone teleop;
    return 0;
}
