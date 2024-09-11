#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/PoseStamped.h>

geometry_msgs::Twist cmd_vel;
geometry_msgs::PoseStamped pose;

ros::Duration dt;
ros::Publisher pose_pub;
ros::Time curr_time;
ros::Time last_time;

void cmd_vell_cb(const geometry_msgs::Twist::ConstPtr& msg){
    last_time = curr_time;
    curr_time = ros::Time::now();
    dt = curr_time - last_time;
    
    cmd_vel = *msg;

    tf2::Quaternion q;
    float kP = 0.01;

    pose.header.frame_id = "map";
    pose.header.stamp = curr_time;

    pose.pose.position.x += cmd_vel.linear.x * dt.toSec();
    pose.pose.position.y += cmd_vel.linear.y * dt.toSec();
    pose.pose.position.z += cmd_vel.linear.z * dt.toSec();
    
    q.setRPY(cmd_vel.angular.x * dt.toSec() * kP,
             cmd_vel.angular.y * dt.toSec() * kP,
             cmd_vel.angular.z * dt.toSec() * kP); 
    
    pose.pose.orientation.x += q.x();        
    pose.pose.orientation.y += q.y();
    pose.pose.orientation.z += q.z();
    pose.pose.orientation.w = q.w();

    pose_pub.publish(pose);

    
}

void start_node(int argc, char** argv){

    ros::init(argc, argv, "pose_publisher_node");
    ros::NodeHandle nh;
    pose_pub = nh.advertise<geometry_msgs::PoseStamped>("/mavros/setpoint_position/local", 10);
    ros::Subscriber cmd_vel_sub = nh.subscribe<geometry_msgs::Twist>("/mavros/setpoint_velocity/cmd_vel_unstamped",10, cmd_vell_cb);
    ros::Rate rate(20.0);
    
    curr_time = ros::Time::now();
    last_time = ros::Time::now();

    // Set initial position
    pose.pose.position.x = 0;
    pose.pose.position.y = 0;
    pose.pose.position.z = 1.0;
    pose.pose.orientation.x = 0;
    pose.pose.orientation.y = 0;
    pose.pose.orientation.z = 0;
    pose.pose.orientation.w = 1;

    while (ros::ok()){
        ros::spinOnce();
        rate.sleep();
    }
}




int main(int argc, char** argv){
    start_node(argc, argv);
    return 0;
}