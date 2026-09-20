#!/bin/bash

if [[ $(tmux list-sessions | wc -l) -gt 1 ]]; then
    tmux switch-client -l 2>/dev/null || tmux switch-client -n
    tmux kill-session -t "$1"
fi
