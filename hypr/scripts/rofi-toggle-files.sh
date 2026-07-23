#!/bin/bash

if pgrep -x rofi >/dev/null; then
    pkill -x rofi
else
    rofi -show filebrowser -config "$HOME/.config/rofi/config-lectures.rasi"
fi
