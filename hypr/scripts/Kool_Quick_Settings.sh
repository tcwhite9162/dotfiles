#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for KooL Hyprland Quick Settings (SUPER SHIFT E)

tmp_config_file=$(mktemp)
sed 's/^\$//g; s/ = /=/g' "$config_file" >"$tmp_config_file"
source "$tmp_config_file"
# ##################################### #

# variables
UserConfigs="$HOME/.config/hypr/UserConfigs"
configs="$HOME/.config/hypr/configs"
rofi_theme="$HOME/.config/rofi/hypr-config.rasi"
msg='Choose what to do'
iDIR="$HOME/.config/swaync/images"

# Modify this config file for default terminal and EDITOR
config_file="$UserConfigs/UserDefaults.conf"

# Function to display the menu options without numbers
menu() {
    cat <<EOF
User Defaults
ENV variables
Window Rules
User Keybinds
User Settings
Startup Apps
Decorations
Animations
Laptop Keybinds
Default Keybinds
Kitty Theme
Nvim Config
Workspace Rules
GTK Settings (nwg-look)
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu -config "$rofi_theme" -mesg "$msg")

    # Map choices to corresponding files
    case "$choice" in
    "User Defaults") file="$UserConfigs/UserDefaults.conf" ;;
    "ENV variables") file="$UserConfigs/ENVariables.conf" ;;
    "Window Rules")  file="$UserConfigs/WindowRules.conf" ;;
    "User Keybinds") file="$UserConfigs/UserKeybinds.conf" ;;
    "User Settings") file="$UserConfigs/UserSettings.conf" ;;
    "Startup Apps")  file="$UserConfigs/Startup_Apps.conf" ;;
    "Decorations")   file="$UserConfigs/UserDecorations.conf" ;;
    "Animations")    file="$UserConfigs/UserAnimations.conf" ;;

    "Laptop Keybinds")  file="$UserConfigs/Laptops.conf" ;;
    "Default Keybinds") file="$configs/Keybinds.conf" ;;
    "Workspace Rules")  file="$configs/workspaces.conf" ;;

    "Kitty Theme") file="$HOME/.config/kitty/kitty.conf" ;;
    "Nvim Config") file="$HOME/.config/nvim/init.lua" ;;

    "GTK Settings (nwg-look)")
        if ! command -v nwg-look &>/dev/null; then
            notify-send -i "$iDIR/error.png" "E-R-R-O-R" "Install nwg-look first"
            exit 1
        fi
        nwg-look
        ;;

    *) return ;; # Do nothing for invalid choices

    esac

    if [ -n "$file" ]; then
        kitty --class kitty-nvim -e sh -c "nvim $file"
    fi
}

# Check if rofi is already running
if pidof rofi >/dev/null; then
    pkill rofi
fi

main
