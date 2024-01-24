#!/usr/bin/env bash

# This is literally my favorite script I have ever written

declare -A dir_map  # Associative array to map formatted names to actual paths

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    # Get a list of tmux sessions and format them
    tmux_sessions=$(tmux list-sessions -F "#{session_name}" 2> /dev/null | \
                    awk '{print "\033[1;33m" $0 "!\033[0m"}')

    # Find directories and store in associative array
    while IFS= read -r dir; do
        formatted_name=$(basename "$dir" | tr . _)
        dir_map["$formatted_name"]=$dir
        directories+=$formatted_name$'\n'
    done < <(find ~/dotfiles/.config ~/projects ~/school/compsci -mindepth 1 -maxdepth 1 -type d)

    final_list=$(echo -e "${tmux_sessions}\n$(echo -e "$directories" | grep -vFx -f <(echo "$tmux_sessions" | sed 's/\x1b\[[0-9;]*m//g' | sed 's/!$//'))")
    selected=$(echo -e "${final_list}" | fzf --ansi)
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

# Remove any trailing !
selected_name=$(echo "$selected" | tr . _ | sed 's/!$//')

# Retrieve the actual path from associative array
selected_path=${dir_map[$selected_name]}

# Switch into already existing session if it exists
if tmux has-session -t="$selected_name" 2> /dev/null; then
	if [ -n "$TMUX" ]; then
		tmux switch -t "$selected_name"
	else
		tmux attach-session -t "$selected_name"
	fi

	exit 0
fi

# Create a new session if it doesn't exist
if ! tmux new-session -ds "$selected_name" -c "$selected_path"; then
	echo "Failed to create tmux session"
	exit 1
fi

# Attach to newly created session
if [ -n "$TMUX" ]; then
	tmux switch -t "$selected_name"
else
	tmux attach-session -t "$selected_name"
fi
