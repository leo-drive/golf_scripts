#!/usr/bin/env bash

sleep 5

source ~/projects/autoware/install/setup.bash 
export VEHICLE_ID=golf
ros2 launch autoware_launch autoware.launch.xml map_path:=/home/golf/files/ytu_map/ vehicle_model:=golf_vehicle sensor_model:=golf_sensor_kit
