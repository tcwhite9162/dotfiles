#!/bin/bash

CFG_FILE="$HOME/.config/hypr/UserConfigs/UserDecorations.conf"
ON_STR="  gaps_in = "
OFF_STR="  gaps_out = "

# get_current_in() {
#     grep "$ON_STR" "$CFG_FILE" | cut -d" " -f5
# }
#
# get_current_out() {
#     grep "$OFF_STR" "$CFG_FILE" | cut -d" " -f5
# }
#
# main
case "$1" in
"--in")
    curr=$(grep "$ON_STR" "$CFG_FILE" | cut -d" " -f5)
    line="gaps_in = "
    ;;
"--out")
    curr=$(grep "$OFF_STR" "$CFG_FILE" | cut -d" " -f5)
    line="gaps_out = "
    ;;
*)
    echo "usage: [--in|--out] [--inc|--dec] <STEP?>"
    exit 1
    ;;
esac

if [ -n "$3" ]; then
    STEP=$(("$3"))
else
    STEP=1
fi

case "$2" in
"--inc")
    new=$((curr < 50 ? curr+STEP : 50)) # clamp max to 50
    ;;
"--dec")
    new=$((curr > STEP ? curr-STEP : 1)) # clamp min to 1 (0 clips borders on the edge)
    ;;
*)
    echo "usage: [--in|--out] [--inc|--dec] <STEP?>"
    exit 1
    ;;
esac

before="$line$curr"
after="$line$new"
# sed -i "s|$ON_STR|$OFF_STR|" "$TARGET"
sed -i "s/$before/$after/g" "$CFG_FILE"
