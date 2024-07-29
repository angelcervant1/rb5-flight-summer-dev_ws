cmake_minimum_required(VERSION 3.0.2)
project(rb5_navigation)  # Adjust the package name if it's different

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  mavros_msgs
  nav_msgs
  roscpp
  rospy
  std_msgs
  tf2_ros
  tf_conversions
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

###################################
## catkin specific configuration ##
###################################
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES rb5_navigation
  CATKIN_DEPENDS geometry_msgs mavros_msgs nav_msgs roscpp rospy std_msgs tf2_ros tf_conversions
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
add_executable(offb_node src/offb_node.cpp)

## Add cmake target dependencies of the executable
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
add_dependencies(offb_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(offb_node
  ${catkin_LIBRARIES}
)

#############
## Install ##
#############

## Mark executables for installation
## See http://docs.ros.org/melodic/api/catkin/html/howto/format1/building_executables.html
install(TARGETS offb_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)