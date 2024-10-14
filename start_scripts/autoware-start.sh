#! /usr/bin/env bash

sleep 5
echo Autostart process has started.

source /opt/ros/humble/setup.bash

DISPLAY=:1
export DISPLAY
echo DISPLAY="$DISPLAY"

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# shellcheck disable=SC1083
export CYCLONEDDS_URI=/home/golf/cyclonedds.xml
export RCUTILS_COLORIZED_OUTPUT=1
export RCUTILS_CONSOLE_OUTPUT_FORMAT='[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})'
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

source ~/projects/autoware.golf.dev/install/setup.bash

echo Running ROS 2 launch.

ros2 launch autoware_launch autoware.launch.xml \
  map_path:=/home/golf/files/autoware_map/ytu-demo/ \
  vehicle_model:=golf_vehicle \
  sensor_model:=golf_sensor_kit

