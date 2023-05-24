#!/usr/bin/env bash

sleep 7

source ~/projects/autoware/install/setup.bash 
ros2 launch leo_vcu_driver leo_vcu_driver.launch.xml
