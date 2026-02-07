#!/bin/bash

STATE_FILE="$HOME/.cache/redshift-temp"

if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT=6500
fi

if [ "$CURRENT" -eq 6500 ]; then
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 4500
    echo 4500 >"$STATE_FILE"
else
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500
    echo 6500 >"$STATE_FILE"
fi
