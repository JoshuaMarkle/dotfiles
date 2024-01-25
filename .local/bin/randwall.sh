#!/bin/bash

WALLPAPER_DIR="$HOME/pictures/wallpapers"

# Get only images
WALLPAPER=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)

# Set the wallpaper
swww img $WALLPAPER --transition-type grow --transition-pos 0.88,0.977 --transition-duration 2
