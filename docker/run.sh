#!/bin/bash
docker run --net=host -it --rm \
           --gpus all \
           -e NVIDIA_DRIVER_CAPABILITIES=all \
           -e DISPLAY=$DISPLAY \
           -v $HOME/.Xauthority:/root/.Xauthority \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v $(realpath ..):/root/catkin_ws/src/direct_lidar_odometry \
           -w /root/catkin_ws/src/direct_lidar_odometry \
           $@ \
           direct_lidar_odometry