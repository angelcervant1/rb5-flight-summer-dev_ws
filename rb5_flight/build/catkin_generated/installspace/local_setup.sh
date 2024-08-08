#!/usr/bin/env sh
# generated from catkin/cmake/template/local_setup.sh.in

# since this file is sourced either use the provided _CATKIN_SETUP_DIR
# or fall back to the destination set at configure time
<<<<<<< HEAD
: ${_CATKIN_SETUP_DIR:=/ros_ws/rb5_flight/install}
=======
: ${_CATKIN_SETUP_DIR:=/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install}
>>>>>>> 2-ros-teleop
CATKIN_SETUP_UTIL_ARGS="--extend --local"
. "$_CATKIN_SETUP_DIR/setup.sh"
unset CATKIN_SETUP_UTIL_ARGS
