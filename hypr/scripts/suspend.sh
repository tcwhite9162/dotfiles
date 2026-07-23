#!/bin/bash

if playerctl status | grep -qi "playing"; then
    echo "media playing. not suspending"
    exit 0;
fi

systemctl suspend
