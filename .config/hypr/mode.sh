#!/bin/bash

FILENAME="hyprland.conf"

# Check arguments
target=$1
if [ -z $target ]; then
	# No command line arguments -> toggle mode
	
	# Get the current mode
	mode=$(head -n1 $FILENAME | grep -o 'Mode: [^ ]*' | cut -d' ' -f2)
	if [ $mode == "casual" ]; then
		target="focused"
	else
		# If not in casual mode, go to casual mode
		target="casual"
	fi
else
	# Verify arguments
	if [[ $target != "casual" && $target != "focused" ]]; then
		echo "Invalid argument"
		exit 1
	fi
fi

echo $target
