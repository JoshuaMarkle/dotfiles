#!/bin/bash

# Check the current keyboard variant
layout=$(setxkbmap -query | grep variant | awk '{print $2}')

# Switch to the other layout
if [ "$layout" != "dvorak" ]; then
    setxkbmap -layout us -variant dvorak
    notify-send -u normal "Keyboard" "Switched layout to dvorak"
else
    setxkbmap us
    notify-send -u normal "Keyboard" "Switched layout to qwerty"
fi

