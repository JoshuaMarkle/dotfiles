#!/usr/bin/env bash

# This is literally my favorite script I have ever written

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected="$(find ~/dotfiles/.config ~/projects ~/school/compsci -mindepth 1 -maxdepth 1 -type d | fzf)"
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

# Check if the session already exists
if tmux has-session -t="$selected_name" 2> /dev/null; then
    tmux attach-session -t "$selected_name"
    exit 0
fi

# Create and attach to a new session if it doesn't exist
if ! tmux new-session -ds "$selected_name" -c "$selected"; then
    echo "Failed to create tmux session"
    exit 1
fi

tmux attach-session -t "$selected_name"
