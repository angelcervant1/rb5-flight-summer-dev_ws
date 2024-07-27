#!/usr/bin/env python

import rospy
from geometry_msgs.msg import PoseStamped
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster

class DroneOptitrackFollower:
    def __init__(self):
        rospy.init_node('drone_optitrack')
        self.pub = rospy.Publisher('/odom', Odometry, queue_size=10)
        self.sub = rospy.Subscriber('/natnet_ros/RB5_Drone/pose', PoseStamped, self.pose_callback)
        self.odom_broadcaster = TransformBroadcaster()
        
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.wx = 0.0
        self.wy = 0.0
        self.wz = 0.0
        self.w = 0.0
        
        self.current_time = rospy.Time.now()
        self.last_time = rospy.Time.now()

    def pose_callback(self, msg):
        self.x = msg.pose.position.x
        self.y = msg.pose.position.y
        self.z = msg.pose.position.z
        self.wx = msg.pose.orientation.x
        self.wy = msg.pose.orientation.y
        self.wz = msg.pose.orientation.z
        self.w = msg.pose.orientation.w

    def update(self):
        self.current_time = rospy.Time.now()

        self.odom_broadcaster.sendTransform(
            (self.x, self.y, self.z),
            (self.wx, self.wy, self.wz, self.w),
            self.current_time,
            "base_link",
            "odom"
        )

        odom = Odometry()
        odom.header.stamp = self.current_time
        odom.header.frame_id = "odom"
        odom.pose.pose.position.x = self.x
        odom.pose.pose.position.y = self.y
        odom.pose.pose.position.z = self.z
        odom.pose.pose.orientation.x = self.wx
        odom.pose.pose.orientation.y = self.wy
        odom.pose.pose.orientation.z = self.wz
        odom.pose.pose.orientation.w = self.w
        odom.child_frame_id = "base_link"

        self.pub.publish(odom)
        self.last_time = self.current_time

    def run(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.update()
            rate.sleep()

if __name__ == "__main__":
    controller = DroneOptitrackFollower()
    try:
        controller.run()
    except rospy.ROSInterruptException:
        pass
