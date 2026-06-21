#!/bin/bash
# # Clipboard Manager. This script uses cliphist, rofi, and wl-copy.
#
# # Variables
# rofi_theme="$HOME/.config/rofi/clipboard.rasi"
# msg=' CTRL DEL = cliphist del (entry)   ||   ALT DEL - cliphist wipe (all)'
# # Actions:
# # CTRL Del to delete an entry
# # ALT Del to wipe clipboard contents
#
# # Check if rofi is already running
# if pidof rofi > /dev/null; then
#   pkill rofi
# fi
#
# while true; do
#     result=$(
#         rofi -i -dmenu \
#             -kb-custom-1 "Control-Delete" \
#             -kb-custom-2 "Alt-Delete" \
#             -config $rofi_theme < <(cliphist list) \
# 			-mesg "$msg" 
#     )
#
#     case "$?" in
#         1)
#             exit
#             ;;
#         0)
#             case "$result" in
#                 "")
#                     continue
#                     ;;
#                 *)
#                     cliphist decode <<<"$result" | wl-copy
#                     exit
#                     ;;
#             esac
#             ;;
#         10)
#             cliphist delete <<<"$result"
#             ;;
#         11)
#             cliphist wipe
#             ;;
#     esac
# done
#




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
