#!/bin/bash

source ~/projects/miav/install/setup.bash

ros2 run rclcpp_components component_container_mt \
--ros-args \
-r __node:=sensing_component_container
