#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

wifi_low_fg_color=""
wifi_medium_fg_color=""
wifi_high_fg_color=""

wifi_low_default_fg_color="#[fg=#ff0000]"
wifi_medium_default_fg_color="#[fg=#ffff00]"
wifi_high_default_fg_color="#[fg=#00ff00]"

get_fg_color_settings() {
    wifi_low_fg_color=$(get_tmux_option "@wifi_low_fg_color" "$wifi_low_default_fg_color")
    wifi_medium_fg_color=$(get_tmux_option "@wifi_medium_fg_color" "$wifi_medium_default_fg_color")
    wifi_high_fg_color=$(get_tmux_option "@wifi_high_fg_color" "$wifi_high_default_fg_color")
}

print_fg_color() {
    local wifi_percentage=$($CURRENT_DIR/wifi_percentage.sh)
    local wifi_quality=$(wifi_status $wifi_percentage)
    if [ $wifi_quality == "low" ]; then
        echo "$wifi_low_fg_color"
    elif [ $wifi_quality == "medium" ]; then
        echo "$wifi_medium_fg_color"
    elif [ $wifi_quality == "high" ]; then
        echo "$wifi_high_fg_color"
    fi
}

main() {
    get_fg_color_settings
    print_fg_color
}
main
