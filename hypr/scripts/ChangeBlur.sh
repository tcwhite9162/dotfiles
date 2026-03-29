# STATE=$(hyprctl -j getoption decoration:blur:enabled | jq -r ".int")
#
# if [ "$STATE" == "1" ]; then
#   hyprctl keyword decoration:blur:enabled false
# else
#   hyprctl keyword decoration:blur:enabled true
# fi



#!/bin/bash

CFG_DIR="$HOME/.config/hypr/terminal-blur"
ACTIVE="$CFG_DIR/active"
MAINCFG="$HOME/.config/hypr/hyprland.conf"

BLUR_ON="source = $HOME/.config/hypr/terminal-blur/blur-on.conf"
BLUR_OFF="source = $HOME/.config/hypr/terminal-blur/blur-off.conf"

if [ ! -f "$ACTIVE" ]; then
    echo "on" > "$ACTIVE"
fi

STATE=$(cat "$ACTIVE")

if [ "$STATE" = "on" ]; then
    # Switch to opaque terminal
    sed -i "s|$BLUR_ON|$BLUR_OFF|" "$MAINCFG"
    echo "off" > "$ACTIVE"
else
    # Switch to blurred transparent terminal
    sed -i "s|$BLUR_OFF|$BLUR_ON|" "$MAINCFG"
    echo "on" > "$ACTIVE"
fi

hyprctl reload
