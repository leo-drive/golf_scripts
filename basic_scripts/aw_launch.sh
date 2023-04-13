#!/usr/bin/env bash

sleep 4

source ~/projects/autoware/install/setup.bash 
ros2 launch autoware_launch autoware.launch.xml map_path:=/home/golf/files/ytu_map/ vehicle_model:=golf_vehicle sensor_model:=golf_sensor_kit vehicle_id:=golf
