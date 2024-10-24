#! /usr/bin/env bash

sleep 5
echo Autostart process has started.

source /opt/ros/humble/setup.bash

DISPLAY=:1
export DISPLAY
echo DISPLAY="$DISPLAY"

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export CYCLONEDDS_URI=/home/golf/cyclonedds.xml
export RCUTILS_COLORIZED_OUTPUT=1
export RCUTILS_CONSOLE_OUTPUT_FORMAT='[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})'
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"


# Source environment-specific variables
if [ -f /home/golf/autoware.env ]; then
  source /home/golf/autoware.env
else
  echo "Environment file not found!"
  exit 1
fi
source "$AUTOWARE_PROJECT_PATH/install/setup.bash"

echo "Running ROS 2 launch."

# Use variables from .env file
ros2 launch autoware_launch autoware.launch.xml \
  map_path:="$MAP_PATH" \
  vehicle_model:="$VEHICLE_MODEL" \
  sensor_model:="$SENSOR_MODEL"
