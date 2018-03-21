#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

wifi_ascii_char=""
wifi_ascii_char_default=+++

get_wifi_ascii_char() {
    wifi_ascii_char=$(get_tmux_option "@wifi_ascii_char" "$wifi_ascii_char_default")
}

print_wifi_ascii() {
    local wifi_percentage=$($CURRENT_DIR/wifi_percentage.sh)
    local wifi_quality=$(wifi_status $wifi_percentage)
    if [ $wifi_quality == "low" ]; then
        echo "${wifi_ascii_char:0:1}"
    elif [ $wifi_quality == "medium" ]; then
        echo "${wifi_ascii_char:0:2}"
    elif [ $wifi_quality == "high" ]; then
        echo "${wifi_ascii_char:0:3}"
    fi
}

main() {
    get_wifi_ascii_char
	local wifi_graph=$(print_wifi_ascii "$1")
	echo "$wifi_graph"
}
main
