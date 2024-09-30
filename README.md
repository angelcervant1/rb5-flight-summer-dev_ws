# ROS Packages for Operating the Qualcomm RB5 Drone

## Is This Repository Right for You?

This repository is ideal if you’re looking to:

  - Teleoperate the RB5 Drone using your own keyboard or joystick.
  - Integrate a Visual SLAM solution for autonomous navigation.
  - Use OptiTrack Motion Capture for real-time pose tracking and high-precision localization.
  - Simulate and validate motion planning algorithms in a controlled environment using Gazebo.

## Overview

This repository provides a set of 4 ROS packages for the following purposes respectively: 

- MAVROS Interface
- OptiTrack Interface
- Navigation
- Simulation
  
## Key Features

  - Real-time Drone Control: Manual teleoperation using a keyboard or joystick for full control of the RB5 drone.
  - Simulation Support: Easily test and simulate the drone’s behavior, navigation, and motion planning within the Gazebo simulation environment.
  - Visual SLAM Integration (Experimental): Incorporates initial support for autonomous navigation using Visual SLAM techniques, helping to enable mapping and localization in unknown environments.
  - MoCap System Integration: Leverage OptiTrack or other motion capture systems for highly accurate, real-time pose tracking and localization.
  

## Compatibility

This ROS environment has been tested and optimized for ROS Melodic on Ubuntu 18.04, ensuring stable operation with the Qualcomm RB5 Drone hardware.

## Further Documentation and Support

- [MAVROS](http://wiki.ros.org/mavros) Documentation for insights on MAVLink communication with ROS.
- [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu) Documentation for general ROS usage and troubleshooting.
- [OptiTrack](https://optitrack.com/) Documentation for details on setting up the motion capture system.
- [NatNet ROS](https://github.com/L2S-lab/natnet_ros_cpp) Client/Server Documentation to integrate OptiTrack multicast with ROS.

## If you have any further questions on how to run or configure the environment, feel free to open an issue.
