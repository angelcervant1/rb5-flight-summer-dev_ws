#!/usr/bin/env python

import rospy
from std_msgs.msg import String

class Listener:
    def __init__(self):
        rospy.init_node('listener', anonymous=False)
        self.sub = rospy.Subscriber('/chatter', String, self.callback)
        self.rate = rospy.Rate(10)  # 10 Hz

    def callback(self, msg):
        rospy.loginfo("I heard: %s", msg.data)

if __name__ == "__main__":
    
    while not rospy.is_shutdown():
        listener = Listener()
        rospy.spin()  # Keeps the node running
