#!/usr/bin/env python

import rospy
from sensor_msgs.msg import CameraInfo
import yaml

def load_camera_info(yaml_file):
    with open(yaml_file, 'r') as file:
        data = yaml.safe_load(file)

    camera_info = CameraInfo()
    camera_info.height = data['height']
    camera_info.width = data['width']
    camera_info.distortion_model = data['distortion_model']
    camera_info.D = data['D']
    camera_info.K = data['K']
    camera_info.R = data['R']
    camera_info.P = data['P']
    camera_info.header.stamp = rospy.Time.now()

    return camera_info

def publish_camera_info(yaml_file):
    rospy.init_node('camera_info_publisher', anonymous=True)
    pub = rospy.Publisher('/camera/camera_info', CameraInfo, queue_size=10)
    rate = rospy.Rate(10)  # 10 Hz

    while not rospy.is_shutdown():
        camera_info = load_camera_info(yaml_file)
        pub.publish(camera_info)
        
        rate.sleep()

if __name__ == '__main__':
    try:
        yaml_file = rospy.get_param('~camera_config_path', '/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src/rb5_navigation/config/rb5_drone_tracking_cam_conf.yaml')
        publish_camera_info(yaml_file)
    except rospy.ROSInterruptException:
        pass
