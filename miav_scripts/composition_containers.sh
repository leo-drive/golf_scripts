#!/bin/bash

cleanup_log_file="/tmp/miav_launch.log"
rm -f "$cleanup_log_file"

# Function to kill child processes when the script exits
cleanup() {
  echo "Cleanup function is triggered from $0" >> $cleanup_log_file

  if [[ -n $SID ]]; then
#      pkill -s $SID       # Send SIGTERM to all processes in the session
#      sleep 1             # Give processes a moment to shut down gracefully
      pkill -9 -s $SID    # Force kill any stubborn processes in the session
      echo $SID >> /tmp/script.log
      echo "Terminated $SID from $0" >> $cleanup_log_file
  fi
}

# Set the cleanup function to be called on script exit, terminal close or termination
trap cleanup EXIT SIGHUP SIGTERM SIGINT

setsid bash -c "source ~/projects/miav/install/setup.bash; ros2 run rclcpp_components component_container_mt --ros-args -r __node:=sensing_component_container" &
SID=$!
echo "SID: $SID"
wait $SID
