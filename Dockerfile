ARG ROS_VERSION=noetic
FROM ros:$ROS_VERSION

ARG ROS2_VERSION=foxy

ARG ROS_VERSION
ENV ROS_VERSION=${ROS_VERSION}
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS1_INSTALL_PATH=/opt/ros/noetic
ENV ROS2_INSTALL_PATH=/opt/ros/foxy

RUN \
  DEBIAN_FRONTEND=noninteractive \
  echo "ROS Version is: " ${ROS_VERSION} && \
  apt-get update -yq && apt-get install -yq \
  apt-utils \
    build-essential \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool build-essential \
    libcanberra-gtk-module


RUN \
  apt-get install -yq \
    wget 
RUN \
  apt-get install -yq \
    nano 
RUN \
  apt-get install -yq \
    git
RUN \
  apt-get install -yq \
    libtiff-dev
RUN \
  apt-get install -yq \
    libcurl4-openssl-dev
    
RUN apt-get install -yq software-properties-common
RUN add-apt-repository universe
RUN apt update && sudo apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update
RUN apt-get install -yq ros-foxy-ros-base python3-argcomplete
RUN apt-get install -yq ros-dev-tools
WORKDIR /usr/local/ros2
RUN mkdir src
RUN cd src && git clone -b foxy https://github.com/ros2/ros1_bridge.git
RUN \
  /bin/bash -c "source ${ROS1_INSTALL_PATH}/setup.bash ; source ${ROS2_INSTALL_PATH}/setup.bash ; colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure"



    
WORKDIR /usr/local/ros
COPY src /usr/local/ros/src/ 

RUN \
  DEBIAN_FRONTEND=noninteractive \
  rosdep install --from-paths src --ignore-src --rosdistro=${ROS_VERSION} -y
  
RUN \
  /bin/bash -c "source /opt/ros/${ROS_VERSION}/setup.bash ; catkin_make"
  
ENV ROS1_WS_PATH=/usr/local/ros
ENV ROS2_WS_PATH=/usr/local/ros2
  
RUN useradd -ms /bin/bash project_11

USER project_11


ENTRYPOINT /bin/bash -c "/bin/bash"

#ENTRYPOINT /bin/bash -c "source /usr/local/ros/devel/setup.bash ;\
#                       /bin/bash"




    
    
