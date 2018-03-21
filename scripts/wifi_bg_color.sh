#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

wifi_low_bg_color=""
wifi_medium_bg_color=""
wifi_high_bg_color=""

wifi_low_default_bg_color="#[bg=green]"
wifi_medium_default_bg_color="#[bg=yellow]"
wifi_high_default_bg_color="#[bg=red]"

get_bg_color_settings() {
    wifi_low_bg_color=$(get_tmux_option "@wifi_low_bg_color" "$wifi_low_default_bg_color")
    wifi_medium_bg_color=$(get_tmux_option "@wifi_medium_bg_color" "$wifi_medium_default_bg_color")
    wifi_high_bg_color=$(get_tmux_option "@wifi_high_bg_color" "$wifi_high_default_bg_color")
}

print_bg_color() {
    local wifi_percentage=$($CURRENT_DIR/wifi_percentage.sh)
    local wifi_quality=$(wifi_status $wifi_percentage)
    if [ $wifi_quality == "low" ]; then
        echo "$wifi_low_bg_color"
    elif [ $wifi_quality == "medium" ]; then
        echo "$wifi_medium_bg_color"
    elif [ $wifi_load_status == "high" ]; then
        echo "$wifi_high_bg_color"
    fi
}

main() {
    get_bg_color_settings
	print_bg_color
}
main
