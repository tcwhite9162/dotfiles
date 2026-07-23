#!/bin/bash

if pgrep -x rofi > /dev/null; then
    pkill -x rofi
else
    if [ "$1" == "-L" ]; then
        rofi -show filebrowser -modi filebrowser -config "$HOME/.config/rofi/config-lectures.rasi"
    else
        rofi -show drun -modi drun -config "$HOME/.config/rofi/config.rasi"
    fi
fi
