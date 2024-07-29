#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <iostream>

class TeleopDrone
{
public:
    TeleopDrone()
    {
        cmd_vel_pub_ = nh_.advertise<geometry_msgs::Twist>("mavros/setpoint_velocity/cmd_vel_unstamped", 10);
        startControlLoop();
    }

private:
    ros::NodeHandle nh_;
    ros::Publisher cmd_vel_pub_;

    void startControlLoop()
    {
        char key;
        geometry_msgs::Twist cmd_vel;

        while (ros::ok())
        {
            std::cout << "Enter command (w/s/a/d/r/f/u/j): ";
            std::cin >> key;

            switch (key)
            {
                case 'w': cmd_vel.linear.x = 1.0; break;   // Move forward
                case 's': cmd_vel.linear.x = -1.0; break;  // Move backward
                case 'a': cmd_vel.linear.y = 1.0; break;   // Move left
                case 'd': cmd_vel.linear.y = -1.0; break;  // Move right
                case 'r': cmd_vel.angular.z = 1.0; break;   // Rotate clockwise
                case 'f': cmd_vel.angular.z = -1.0; break;  // Rotate counter-clockwise
                case 'u': cmd_vel.linear.z = 1.0; break;   // Move up
                case 'j': cmd_vel.linear.z = -1.0; break;  // Move down
                default: std::cout << "Invalid key. Use 'w', 's', 'a', 'd', 'r', 'f', 'u', or 'j'." << std::endl;
            }

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
