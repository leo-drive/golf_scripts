#!/bin/bash

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

ros2 launch one_launch one_launch.launch.xml
