#!/bin/bash

STATE_FILE="$HOME/.cache/redshift-temp"

reset() {
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500 # normal
    echo "0" >"$STATE_FILE"
}

if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT=6500
fi

if [[ "$#" == "1" && "$1" == "reset" ]]; then
    reset
elif [ "$CURRENT" == "0" ]; then
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4500 # red
    echo "1" >"$STATE_FILE"
elif [ "$CURRENT" == "1"  ]; then
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3800 # redder
    echo "2" >"$STATE_FILE"
else
    reset
fi
