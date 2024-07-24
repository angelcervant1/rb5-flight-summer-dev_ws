#!/usr/bin/env python

import rospy
from std_msgs.msg import String

class Publisher:
    def __init__(self):
        rospy.init_node('publisher', anonymous=False)
        self.pub = rospy.Publisher('/chatter', String, queue_size=5)
        self.rate = rospy.Rate(10)  # 10 Hz
        
    def run(self):
        while not rospy.is_shutdown():
            msg = "Hello World!"
            self.pub.publish(msg)   
            rospy.loginfo("Published: %s", msg)
            self.rate.sleep()

if __name__ == "__main__":
    try:
        publisher = Publisher()
        publisher.run()
    except rospy.ROSInterruptException:
        pass
