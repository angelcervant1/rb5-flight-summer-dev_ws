#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster
import tf_conversions

class DroneController:
    def __init__(self):
        rospy.init_node('drone_teleop')
        self.pub = rospy.Publisher('/odom', Odometry, queue_size=10)
        self.sub = rospy.Subscriber('/cmd_vel', Twist, self.cmd_vel_callback)
        self.odom_broadcaster = TransformBroadcaster()
        
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.th = 0.0
        
        self.vx = 0.0
        self.vy = 0.0
        self.vz = 0.0
        self.vth = 0.0
        
        self.current_time = rospy.Time.now()
        self.last_time = rospy.Time.now()

    def cmd_vel_callback(self, msg):
        self.vx = msg.linear.x
        self.vy = msg.linear.y
        self.vz = msg.linear.z
        self.vth = msg.angular.z

    def update(self):
        self.current_time = rospy.Time.now()
        dt = (self.current_time - self.last_time).to_sec()
        self.x += self.vx * dt
        self.y += self.vy * dt
        self.z += self.vz * dt
        self.th += self.vth * dt

        odom_quat = tf_conversions.transformations.quaternion_from_euler(0, 0, self.th)

        self.odom_broadcaster.sendTransform(
            (self.x, self.y, self.z),
            odom_quat,
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
        odom.pose.pose.orientation.x = odom_quat[0]
        odom.pose.pose.orientation.y = odom_quat[1]
        odom.pose.pose.orientation.z = odom_quat[2]
        odom.pose.pose.orientation.w = odom_quat[3]
        odom.child_frame_id = "base_link"
        odom.twist.twist.linear.x = self.vx
        odom.twist.twist.linear.y = self.vy
        odom.twist.twist.linear.z = self.vz
        odom.twist.twist.angular.z = self.vth

        self.pub.publish(odom)
        self.last_time = self.current_time

    def run(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            self.update()
            rate.sleep()

if __name__ == "__main__":
    controller = DroneController()
    try:
        controller.run()
    except rospy.ROSInterruptException:
        pass
