# Ros Packages to operate the Qualcomm RB5 Drone 

## Overview
This repository provides a collection of ROS packages to control the Qualcomm RB5 Drone both in simulation and in real-world testing. The drone operates via the MAVLink protocol, enabling seamless communication between ROS and the drone's flight controller using MAVROS. A MoCap system (OptiTrack) was also considered within the development of this packages. 

### Key Features

    Real-time Drone Control: Manual teleoperation of the RB5 drone via keyboard or joystick.
    Simulation Support: Test and simulate drone behavior and navigation using Gazebo.
    Visual SLAM Integration (Experimental): Initial support for autonomous navigation using Visual SLAM techniques.
    MoCap System Integration: Leverage external motion capture systems (like OptiTrack) for precise, real-time localization and positioning.

### Compatibility

This ROS environment has been developed and tested on ROS Melodic and Ubuntu 18.04 to ensure stable operation with the Qualcomm RB5 Drone.
Docker Support

The repository includes a Dockerfile, allowing users to easily build a Docker image to run the ROS environment in a containerized setup. This simplifies the development process by providing a consistent and reproducible environment.
