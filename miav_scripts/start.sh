#!/bin/bash

DIR_MAIN="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DIR_LAUNCH_SCRIPTS=${DIR_MAIN}
echo "Current directory: ${DIR_LAUNCH_SCRIPTS}"

array_path_scripts=()
array_path_scripts+=("$DIR_LAUNCH_SCRIPTS/composition_containers.sh")
array_path_scripts+=("$DIR_LAUNCH_SCRIPTS/aw_launch.sh")

function run_in_tab() {
cmd1="bash -c $1"
mate-terminal --tab --command="bash -ic 'echo $cmd1 >> $HOME/.bash_history; trap bash SIGINT; $cmd1 ; bash'"
}

for path_script in "${array_path_scripts[@]}"; do
    run_in_tab "${path_script}"
done


