#!/usr/bin/env bash

# Function to set volume
set_volume() {
    local volume_level=$1
    if [[ "$volume_level" =~ ^[0-9]+$ ]] && [ "$volume_level" -ge 0 ] && [ "$volume_level" -le 100 ]; then
        # Set the volume
        amixer -Mq set Master "$volume_level%" unmute
    fi
}

# Directory of the script (and the .rasi file)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Main Rofi command to get user input
volume_level=$(rofi -dmenu -location "3" -p "Set volume: " -lines 0 -theme "$DIR/rofi-volume.rasi")

# Call function to set volume
set_volume "$volume_level"
