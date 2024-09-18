# Use the NVIDIA CUDA base image
FROM nvidia/cuda:12.1.0-base-ubuntu18.04


# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
RUN apt-get update -q && \
    apt-get install -y ros-melodic-desktop-full python-rosdep &&\
    apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools python3-vcstool &&\
    rm -rf /var/lib/apt/lists/*
RUN rosdep init
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN rosdep update

# Install ROS dependencies
RUN apt-get update && apt-get install -y \
    python-rosdep \
    python-rosinstall \
    python-rosinstall-generator \
    python-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCV 4.2
RUN apt-get update && apt-get install -y \
    cmake \
    git \
    pkg-config \
    libjpeg-dev \
    libtiff-dev \
    libpng-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran \
    python2.7-dev \
    libopencv-dev=3.2.* \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip


# Install missing ROS Packages
RUN apt-get update && apt-get install -y \
    ros-melodic-teleop-twist-keyboard \
    ros-melodic-mavros ros-melodic-mavros-extras ros-melodic-control-toolbox \
    ros-melodic-hector-trajectory-server \
    ros-melodic-camera-calibration \
    ros-melodic-image-pipeline \
    ros-melodic-cv-bridge \
    ros-melodic-usb-cam \
    ros-melodic-map-server \
    libncurses5-dev \
    libncursesw5-dev \
    iputils-ping \
    wget \
    libeigen3-dev \
    libepoxy-dev \
    libopencv-dev \
    nano \
    && rm -rf /var/lib/apt/lists/*
    
RUN apt-get update && \
    apt-get install -y \
    gnupg \
    software-properties-common \
    libgtk2.0-dev \
    libgl1-mesa-dev \
    libglew-dev \
    libboost-all-dev \
    libyaml-cpp-dev \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -sc) main"
    
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libssl-dev \
        libudev-dev \
        libusb-1.0-0-dev \
        librealsense2-dev \
        librealsense2-utils \
        ros-melodic-realsense2-camera &&  \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt


# Setup environment
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh \
    && chmod +x install_geographiclib_datasets.sh \
    && ./install_geographiclib_datasets.sh \
    && rm install_geographiclib_datasets.sh

SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# Set default command
CMD ["bash"]
