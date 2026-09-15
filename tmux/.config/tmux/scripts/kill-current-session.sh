#!/bin/bash

session_count=$(tmux list-sessions | wc -l)

if [[ "$session_count" -gt 1 ]]; then
	current_session=$(tmux display-message -p '#S')
	first_session=$(tmux list-sessions -F '#S' | grep -v "^$current_session$" | head -n 1)

	tmux switch-client -t "$first_session"
	tmux kill-session -t "$current_session"
else
	exit 0
fi
