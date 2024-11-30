FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y \
    python3-catkin-tools \
    python3-osrf-pycommon \
    python3-pip \
    git \
    ros-noetic-mavros \
    ros-noetic-mavros-extras \
    libgstreamer-plugins-base1.0-dev \
    vim \
    ros-geometry-msgs && \
    rm -rf /var/lib/apt/lists/*

# Install GeographicLib datasets
RUN wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh && \
    bash ./install_geographiclib_datasets.sh && \
    rm install_geographiclib_datasets.sh

# Install Python packages
RUN pip3 install kconfiglib jinja2 jsonschema packaging toml pyros-genmsg future roslibpy scipy numpy python-math

# Setup workspace and repositories
COPY assignment/ /workspace/assignment/
RUN . /opt/ros/noetic/setup.sh && \
    cd /workspace/assignment/resources/ && \
    git clone -b v1.13.3 https://github.com/PX4/PX4-Autopilot && \
    cd PX4-Autopilot && \
    git apply /workspace/assignment/scripts/0001-Added-depth-iris.patch && \
    DONT_RUN=1 make px4_sitl gazebo && \
    cd ../ && \
    git clone -b ros1 https://github.com/aws-robotics/aws-robomaker-small-house-world

# Automatically source ROS setup script for bash sessions
RUN echo "source /opt/ros/noetic/setup.sh" >> /etc/bash.bashrc

WORKDIR /workspace/assignment/


