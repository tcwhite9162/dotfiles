#!/bin/bash

CURRENT=$(hyprctl hyprsunset temperature)

if [ "$CURRENT" == "6500" ]; then
    hyprctl hyprsunset temperature 4500
else
    hyprctl hyprsunset temperature 6500
fi
