#!/usr/bin/env bash

STATE_FILE="$HOME/.config/hypr/speedrun_mode"

if [ ! -f "$STATE_FILE" ]; then
    echo "off" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [ "$STATE" = "off" ]; then
    echo "on" > "$STATE_FILE"
    sudo cp /etc/keyd/toggle/speedrun.conf /etc/keyd/active.conf
    sudo keyd reload
else
    echo "off" > "$STATE_FILE"
    sudo cp /etc/keyd/toggle/default.conf /etc/keyd/active.conf
    sudo keyd reload
fi
