#!/bin/bash

cleanup_log_file="/tmp/script.log"
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

source ~/projects/miav/install/setup.bash

# List of containers to check
containers=(
"/sensing_component_container"
)

# Function to check if all containers are present
all_containers_present() {
  local present=true
  for container in "${containers[@]}"; do
    if ! ros2 component list | grep -q "$container"; then
      present=false
      break
    fi
  done
  echo "$present"
}

# Loop until all containers are present
while true; do
  if [ "$(all_containers_present)" = true ]; then
    break
  fi
  sleep 0.5 # Wait before checking again
done

echo "All required containers are present!"

# Start the ROS2 nodes in a new session and capture the session ID
setsid bash -c "source ~/projects/miav/install/setup.bash; ros2 launch one_launch one_launch.launch.xml" &
SID=$!
echo "SID: $SID"
wait $SID
