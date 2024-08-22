#! /usr/bin/env python

import rospy
import cv2 as cv
from sensor_msgs.msg import Image, CameraInfo
from cv_bridge import CvBridge, CvBridgeError

#Node to publish camera metadata
"""
/camera/camera_info
/camera/image_raw
"""
class MonocularCamera:
    
    def __init__(self):
        rospy.init_node("monocular_cam")
        self.img_pub = rospy.Publisher("/camera/image_raw", Image, queue_size=10)
        self.info_pub = rospy.Publisher("/camera/camera_info", CameraInfo, queue_size=10)
        self.bridge = CvBridge()
        self.cap = cv.VideoCapture(0) 
        if not self.cap.isOpened():
            rospy.logerr("Failed to open camera!")
            rospy.signal_shutdown("Failed to open camera")
            
    def run(self):
        rate = rospy.Rate(30)  # 30 Hz
        while not rospy.is_shutdown():
            ret, frame = self.cap.read()
            if not ret:
                rospy.logerr("Failed to capture image")
                continue
            
            try:
                ros_image = self.bridge.cv2_to_imgmsg(frame, encoding="bgr8")
                ros_image.header.stamp = rospy.Time.now()
                ros_image.header.frame_id = "camera_frame"
                
                self.img_pub.publish(ros_image)
                
            except CvBridgeError as e:
                rospy.logerr('CvBridgeError: {}'.format(e))            
            rate.sleep()

    def __del__(self):
        if self.cap.isOpened():
            self.cap.release()
        cv.destroyAllWindows()


if __name__ == "__main__":
    camera = MonocularCamera()
    while not rospy.is_shutdown():
        try:
            camera.run()
        except rospy.ROSInterruptException as e:
            rospy.logerr(e)
        finally:
            del(camera)