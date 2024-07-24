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

# Install Python 2 and pip
RUN apt-get update && apt-get install -y \
    python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

# Install missing ROS Packages
RUN apt-get update && apt-get install -y \
    ros-melodic-teleop-twist-keyboard \
    && rm -rf /var/lib/apt/lists/*

# Setup environment
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

# Set default command
CMD ["bash"]
