#!/bin/bash

DIRS=(
	"$HOME/dev"
	"$HOME/dev/NN"
)

selected=$(find "${DIRS[@]}" -maxdepth 1 -type d |
	sed "s|^$HOME/||" |
	sk --reverse --no-info --tmux center --color="bw")

[[ $selected ]] && selected="$HOME/$selected"

[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "$selected"; then
	tmux new-session -ds "$selected_name" -c "$selected"
	tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
