<<<<<<< HEAD
# Install script for directory: /ros_ws/rb5_flight/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/ros_ws/rb5_flight/install")
=======
# Install script for directory: /ros_ws/rb5-flight-summer-dev_ws/rb5_flight/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install")
>>>>>>> 2-ros-teleop
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/_setup_util.py")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/_setup_util.py")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE PROGRAM FILES "/ros_ws/rb5_flight/build/catkin_generated/installspace/_setup_util.py")
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE PROGRAM FILES "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/_setup_util.py")
>>>>>>> 2-ros-teleop
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/env.sh")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/env.sh")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE PROGRAM FILES "/ros_ws/rb5_flight/build/catkin_generated/installspace/env.sh")
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE PROGRAM FILES "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/env.sh")
>>>>>>> 2-ros-teleop
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/setup.bash;/ros_ws/rb5_flight/install/local_setup.bash")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/setup.bash;/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/local_setup.bash")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/setup.bash"
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/local_setup.bash"
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/setup.bash"
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/local_setup.bash"
>>>>>>> 2-ros-teleop
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/setup.sh;/ros_ws/rb5_flight/install/local_setup.sh")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/setup.sh;/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/local_setup.sh")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/setup.sh"
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/local_setup.sh"
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/setup.sh"
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/local_setup.sh"
>>>>>>> 2-ros-teleop
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/setup.zsh;/ros_ws/rb5_flight/install/local_setup.zsh")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/setup.zsh;/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/local_setup.zsh")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/setup.zsh"
    "/ros_ws/rb5_flight/build/catkin_generated/installspace/local_setup.zsh"
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE FILE FILES
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/setup.zsh"
    "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/local_setup.zsh"
>>>>>>> 2-ros-teleop
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
<<<<<<< HEAD
   "/ros_ws/rb5_flight/install/.rosinstall")
=======
   "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install/.rosinstall")
>>>>>>> 2-ros-teleop
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
<<<<<<< HEAD
file(INSTALL DESTINATION "/ros_ws/rb5_flight/install" TYPE FILE FILES "/ros_ws/rb5_flight/build/catkin_generated/installspace/.rosinstall")
=======
file(INSTALL DESTINATION "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/install" TYPE FILE FILES "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/catkin_generated/installspace/.rosinstall")
>>>>>>> 2-ros-teleop
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
<<<<<<< HEAD
  include("/ros_ws/rb5_flight/build/gtest/cmake_install.cmake")
  include("/ros_ws/rb5_flight/build/rb5_simulation/cmake_install.cmake")
=======
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/gtest/cmake_install.cmake")
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/optitrack-vrpn/cmake_install.cmake")
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/mavros-interface/cmake_install.cmake")
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/natnet_ros_cpp/cmake_install.cmake")
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/rb5_navigation/cmake_install.cmake")
  include("/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/rb5_simulation/cmake_install.cmake")
>>>>>>> 2-ros-teleop

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
<<<<<<< HEAD
file(WRITE "/ros_ws/rb5_flight/build/${CMAKE_INSTALL_MANIFEST}"
=======
file(WRITE "/ros_ws/rb5-flight-summer-dev_ws/rb5_flight/build/${CMAKE_INSTALL_MANIFEST}"
>>>>>>> 2-ros-teleop
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
