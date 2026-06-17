#!/bin/bash

DIRS=(
	"$HOME/dev/NN"
	"$HOME/dev/NN/tools"
	"$HOME/dev/NN/tutorials/"
	"$HOME/dev/scripts"
	"$HOME/dotfiles/.config"
)

mapfile -t fzf_output < <(
	find "${DIRS[@]}" -maxdepth 1 -type d,l |
		sed "s|^$HOME/||" |
		fzf --reverse --tmux center --color="bw" --print-query --no-select-1
)

if [[ ${#fzf_output[@]} -gt 0 ]]; then
	query="${fzf_output[0]}"
	selected="${fzf_output[1]}"
else
	exit 0
fi

if [[ -z "$selected" && -n "$query" ]]; then
	selected_name=$(basename "$query" | tr . _)
	selected="$HOME/$query"
	mkdir -p "$selected"
else
	selected_name=$(basename "$selected" | tr . _)
	selected="$HOME/$selected"
fi

if ! tmux has-session -t "$selected"; then
	tmux new-session -ds "$selected_name" -c "$selected"
	tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
