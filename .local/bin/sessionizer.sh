#!/usr/bin/env bash

# This is literally one of the most useful scripts I have

# Define color codes
GRAY="\033[38;5;8m"
RESET="\033[0;37m"

declare -A dir_map  # Associative array to map formatted names to actual paths

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    # Get a list of tmux sessions and format them
    tmux_sessions=$(tmux list-sessions -F "#{session_name}" 2> /dev/null | \
                    awk '{print "\033[1;33m" $0 "\033[0m"}')
	tmux_sessions_clean=$(tmux list-sessions -F "#{session_name}" 2> /dev/null)

	# Find directories and store in associative array
	while IFS= read -r dir; do
		# Extract the full path and the last directory name
		full_path=$(realpath "$dir")
		last_dir_name=$(basename "$dir")
		path_up_to_last=$(dirname "$full_path")

		# If the path is not found in tmux sessions clean
		if ! echo "$tmux_sessions_clean" | grep -Fxq "$last_dir_name"; then
			# Format the full path in gray and the last directory name in normal color
			formatted_name="${GRAY}${path_up_to_last}/${RESET}${last_dir_name}"

			dir_map["$formatted_name"]=$dir
			directories+=$formatted_name$'\n'
		fi

<<<<<<< HEAD
	done < <(find ~/sync/projects ~/projects ~/school ~/dotfiles/.config ~/dotfiles/.local -mindepth 1 -maxdepth 1 -type d)
=======
	done < <(find ~/sync/projects ~/projects ~/dotfiles/.config ~/dotfiles/.local -mindepth 1 -maxdepth 1 -type d)
>>>>>>> 822dc526 (state)

    final_list=$(echo -e "${tmux_sessions}\n$(echo -e "$directories" | grep -vFx -f <(echo "$tmux_sessions" | sed 's/\x1b\[[0-9;]*m//g' | sed 's/!$//'))")
    selected=$(echo -e "${final_list}" | fzf --ansi)
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

# Remove any trailing !
selected_path=$selected
selected_name=$(basename "$selected")
selected_name=$(echo "$selected_name" | tr . _ | sed 's/!$//')

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
