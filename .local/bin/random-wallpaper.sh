#!/bin/bash

# Check if a directory path is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/image/directory"
    exit 1
fi

DIRECTORY=$1

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory does not exist: $DIRECTORY"
    exit 1
fi

# Select a random image from the directory
IMAGE=$(find "$DIRECTORY" -type f | shuf -n 1)

# Check if an image is found
if [ -z "$IMAGE" ]; then
    echo "No images found in the directory."
    exit 1
fi

# Set the wallpaper using Nitrogen
nitrogen --set-scaled "$IMAGE"

echo "Wallpaper set to $IMAGE"
