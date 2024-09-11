#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from std_srvs.srv import Trigger, TriggerResponse
import cv2
from cv_bridge import CvBridge
import os

class ImageCaptureService:
    def __init__(self):
        rospy.init_node('image_capture_service')
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber('/tracking', Image, self.image_callback)
        self.image = None
        
        self.image_folder = '/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/vision/images_captured'
        if not os.path.exists(self.image_folder):
            os.makedirs(self.image_folder)
        
        self.image_counter = 0
        self.service = rospy.Service('/capture_image', Trigger, self.handle_capture_image)

    def image_callback(self, msg):
        self.image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')

    def handle_capture_image(self, req):
        if self.image is not None:
            image_filename = os.path.join(self.image_folder, 'image_{:04d}.jpg'.format(self.image_counter))
            cv2.imwrite(image_filename, self.image)
            rospy.loginfo("Image saved to {}".format(image_filename))            
            self.image_counter += 1
            return TriggerResponse(success=True, message="Image captured successfully.")
        else:
            rospy.logwarn("No image received yet!")
            return TriggerResponse(success=False, message="No image available to capture.")
    
    def run(self):
        rospy.spin()

if __name__ == '__main__':
    service_node = ImageCaptureService()
    service_node.run()
