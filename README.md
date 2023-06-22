# Leo Drive VW Golf Scripts

## Joystick Scripts

> This scripts are for running joystick nodes.

- joy_node.sh: for running joy_node package. The joy_node package makes sense of messages from Joystick.

- G29_node.sh: for running G29_node package. It sends the data from the joy_node to the socketcan packet. In this package, ROS messages are converted to CAN messages.

- can_bridge.sh: for running socketcan package. Socketcan sends the messages it receives to ECOTRON.

- joy_start.sh: for running all of the above

## Start Scripts

> This scripts run the necessary nodes for the vehicle to drive autonomously.

- aw_launch.sh: for running the Autoware

- localization_error_plugin.sh: for running the localization error plugin

- ntrip_client.sh: for running the ntrip client server

- pointcloud_container.sh: for running the pointcloud container

- vcu_driver.sh: for running the vehicle interface driver



## Aliases

> This aliases for running shell files above.

- alias plug: for running the localization_error_plugin.sh file
 
- alias joy: for running the G29_node.sh, can_bridge.sh, joy_node.sh, joy_start.sh files
 
- alias aw: for running the aw_launch.sh 
 
- alias vcu: for running the vcu_driver.sh
 
- alias cont: for running pointcloud_container.sh
 
- alias rtk: for running ntrip_client.sh

- alias start: for running all of the above
