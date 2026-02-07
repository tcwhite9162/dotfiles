#!/bin/bash

# Check if rofi is running
if pgrep -x rofi > /dev/null; then
    # If running, kill it
    pkill -x rofi
else
    # If not running, launch it
    rofi -show drun -modi drun,filebrowser,run,window
fi
