#!/usr/bin/env bash

sleep 2

source ~/projects/joystick_ws/install/setup.bash 
ros2 launch ros2_socketcan socket_can_bridge.launch.xml
