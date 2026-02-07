#!/bin/bash

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "20" ]; then
  hyprctl keyword decoration:blur:size 3
  hyprctl keyword decoration:blur:passes 2
else
  hyprctl keyword decoration:blur:size 50
  hyprctl keyword decoration:blur:passes 20
fi
