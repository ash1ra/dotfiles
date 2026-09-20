#!/bin/bash

if [[ $(tmux list-sessions | wc -l) -gt 1 ]]; then
    tmux kill-session -a -t "$1"
fi
