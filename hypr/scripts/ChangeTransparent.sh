#!/bin/bash

CFG_DIR="$HOME/.config/hypr/configs/transparent-configs"
TARGET="$CFG_DIR/active.conf"

TRANS_ON="source = $CFG_DIR/on.conf"
TRANS_MED="source = $CFG_DIR/medium.conf"
TRANS_OFF="source = $CFG_DIR/off.conf"

ON_STR="#TRANSPARENT_ON"      # transparent
MED_STR="#TRANSPARENT_MEDIUM" # slightly transparent and blurry
OFF_STR="#TRANSPARENT_OFF"    # fully opaque

STATE=$(grep '^#TRANSPARENT_' "$TARGET")

case "$STATE" in
"$OFF_STR")
    sed -i "s|$TRANS_OFF|$TRANS_MED|" "$TARGET"
    sed -i "s|$OFF_STR|$MED_STR|" "$TARGET"
    ;;
"$MED_STR")
    sed -i "s|$TRANS_MED|$TRANS_ON|" "$TARGET"
    sed -i "s|$MED_STR|$ON_STR|" "$TARGET"
    ;;
"$ON_STR")
    sed -i "s|$TRANS_ON|$TRANS_OFF|" "$TARGET"
    sed -i "s|$ON_STR|$OFF_STR|" "$TARGET"
    ;;
esac


hyprctl reload
