#!/bin/bash

DIR_MAIN="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DIR_LAUNCH_SCRIPTS=${DIR_MAIN}
echo "Script started. Current directory: ${DIR_LAUNCH_SCRIPTS}"

array_path_scripts=()
array_path_scripts+=("$DIR_LAUNCH_SCRIPTS/composition_containers.sh")
array_path_scripts+=("$DIR_LAUNCH_SCRIPTS/aw_launch.sh")

echo "Scripts to be launched:"
for path in "${array_path_scripts[@]}"; do
  echo "- $path"
done

function run_in_tab() {
  echo "Launching script in mate-terminal tab: $1"
  local cmd1="bash -c $1"
  local script_name=$(basename "$1")  # Extract the script's name for the tab title

  mate-terminal --tab --title="$script_name" --command="bash -ic 'echo $cmd1 >> $HOME/.bash_history; trap bash SIGINT; $cmd1 ; bash'"
}

for path_script in "${array_path_scripts[@]}"; do
  run_in_tab "${path_script}"
done

echo "All scripts have been initiated in separate tabs."
