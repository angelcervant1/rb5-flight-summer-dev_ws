# Development of ROS Packages for Operating the Qualcomm RB5 Drone in a collaboration with the University of Ottawa

 

I directed the development a comprehensive ROS-based workspace tailored for the Qualcomm RB5 drone platform, focusing on visual servoing and autonomous navigation. This project encompasses four key ROS packages:


## Overview

This repository provides a set of 4 ROS packages for the following purposes respectively: 

- MAVROS Interface: Teleoperate the RB5 Drone using your own keyboard or joystick.
- OptiTrack Interface: Use OptiTrack Motion Capture for real-time pose tracking and high-precision localization.
- Navigation: Integrate a Visual SLAM solution for autonomous navigation.
- Simulation:  Simulate and validate motion planning algorithms in a controlled environment using Gazebo SIL.


## Key Features

  - Real-time Drone Control: Manual teleoperation using a keyboard or joystick for full control of the RB5 drone.
  - Simulation Support: Easily test and simulate the drone’s behavior, navigation, and motion planning within the Gazebo simulation environment.
  - Visual SLAM Integration (Experimental): Incorporates initial support for autonomous navigation using Visual SLAM techniques, helping to enable mapping and localization in unknown environments.
  - MoCap System Integration: Leverage OptiTrack or other motion capture systems for highly accurate, real-time pose tracking and localization.
  

## Compatibility

This ROS environment has been tested and optimized for ROS Melodic on Ubuntu 18.04, ensuring stable operation with the Qualcomm RB5 Drone hardware.

## Configuration




### OptiTrack Setup

1.- Connect both Optitrack and Host computer to the same network.

2.- Make sure that multicast and streaming are enabled on the Motive Final Software.

3.- Add the target rigid bodies to be streamed over.

4.- Source the ws and launch the NatNet Client with `roslaunch natnet_ros_cpp natnet_ros.launch`

5.- If no errors were encountered you should be receiving the real-time pose of the rigid bodies as a `PoseStamped` message. Run `rostopic list` and look for your Rigid Body namespace.

### Dynamic ip address
To resolve the "Server not connected error" it is needed to run the following command on a terminal:
```bash
sudo ip addr add 192.168.137.91/24 dev wlp2s0
```
The previous command will add your host computer temporarily to the OptiTrack subnet. (Typically 192.168.137.xx)

## Further Documentation and Support

- [MAVROS](http://wiki.ros.org/mavros) Documentation for insights on MAVLink communication with ROS.
- [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) Documentation for general ROS usage and troubleshooting.
- [OptiTrack](https://optitrack.com/) Documentation for details on setting up the motion capture system.
- [NatNet ROS](https://github.com/L2S-lab/natnet_ros_cpp) Client/Server Documentation to integrate OptiTrack multicast with ROS.

## If you have any further questions on how to run or configure the environment, feel free to open an issue .
