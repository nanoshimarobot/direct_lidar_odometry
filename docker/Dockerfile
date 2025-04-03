FROM ros:noetic

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
 && apt-get install -y --no-install-recommends wget nano unzip build-essential libomp-dev python3-pip libpcl-dev libeigen3-dev ros-noetic-pcl-* ros-noetic-rviz \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN apt install -y ros-noetic-pcl* 
#\
#  ros-noetic-robot-localization \
#  ros-noetic-robot-state-publisher \
#  ros-noetic-jsk-recognition-msgs \
#  ros-noetic-jsk-rviz-plugins

RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws/src
COPY . /root/catkin_ws/src/direct_lidar_odometry/

WORKDIR /root/catkin_ws
RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; catkin_make -DCMAKE_BUILD_TYPE=Release'
RUN sed -i "6i source \"/root/catkin_ws/devel/setup.bash\"" /ros_entrypoint.sh

WORKDIR /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]