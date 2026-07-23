#!/bin/bash

TARGET="$HOME/.config/hypr/UserConfigs/UserAnimations.conf"

ON_STR="enabled = yes"
OFF_STR="enabled = no"

if grep -q "$ON_STR" "$TARGET"; then
    sed -i "s|$ON_STR|$OFF_STR|" "$TARGET"
else
    sed -i "s|$OFF_STR|$ON_STR|" "$TARGET"
fi
