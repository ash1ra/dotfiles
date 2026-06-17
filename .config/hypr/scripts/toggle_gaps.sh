#!/bin/bash

current=$(hyprctl getoption general:gaps_out | grep "custom type:" | sed 's/.*: //' | awk '{print $1}')

if [ "$current" -eq 0 ]; then
    hyprctl keyword general:gaps_out 20
elif [ "$current" -eq 20 ]; then
    hyprctl keyword general:gaps_out 200
else
    hyprctl keyword general:gaps_out 0
fi
