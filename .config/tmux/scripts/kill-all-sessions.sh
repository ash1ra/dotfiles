#!/bin/bash

session_count=$(tmux list-sessions | wc -l)

if [[ "$session_count" -gt 1 ]]; then
	current_session=$(tmux display-message -p '#S')
	other_sessions=$(tmux list-sessions -F '#S' | grep -v "^$current_session$")

	for session in $other_sessions; do
		tmux kill-session -t "$session"
	done
else
	exit 0
fi
