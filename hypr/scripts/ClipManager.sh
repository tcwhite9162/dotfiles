#!/bin/bash

rofi_theme="$HOME/.config/rofi/clipboard.rasi"

# Get only the most recent 100 entries (cliphist outputs newest first)
LIST=$(cliphist list | head -n 100)

# Extract the text part and number it (1 = newest)
MENU=$(printf "%s\n" "$LIST" \
    | awk -F'\t' '{print $2}' \
    | nl -w1 -s'    ')

# Show the menu
CHOICE=$(echo "$MENU" | rofi -i -dmenu -config "$rofi_theme" -p "Clipboard")

# Exit if nothing selected
[ -z "$CHOICE" ] && exit

# Extract the chosen number
NUM=$(echo "$CHOICE" | awk '{print $1}')

# Extract the corresponding cliphist ID (same order as LIST)
ID=$(printf "%s\n" "$LIST" \
    | awk -F'\t' '{print $1}' \
    | sed -n "${NUM}p")

# Decode and copy
cliphist decode "$ID" | wl-copy
