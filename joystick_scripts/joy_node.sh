#!/usr/bin/env bash

sleep 1

source ~/projects/joystick_ws/install/setup.bash 
ros2 run joy joy_node
