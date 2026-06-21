#!/bin/bash

source "$HOME/.local/airpods-venv/bin/activate"

device_alias=$(bluetoothctl info | grep "Alias" | awk '{print $2}')

if [[ "$device_alias" == "A" ]]; then
    output=$(python $HOME/.config/waybar/scripts/airpods-volume.py)
    echo "$output"
else
    exit 0
fi
