#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_ssid() {
	local wifi_device=$(cat /proc/net/wireless | awk 'END {print $1}' | sed 's/://')
	if command_exists "iwconfig"; then
        local ssid=$(iwconfig "$wifi_device" 2> /dev/null | grep "ESSID" | awk -F\" '{print $2}')
    elif command_exists "iw"; then
        local ssid=$(iw dev "$wifi_device" link 2> /dev/null | grep "SSID" | awk '{print $2}')
    else
        echo "ssid_placeholder"
    fi
    echo $ssid
}

main() {
	local ssid=$(print_ssid "$1")
	echo "$ssid"
}
main
