#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_ssid() {
	local wifi_device=$(cat /proc/net/wireless | awk 'END {print $1}' | sed 's/://')
	local ssid=$(iwconfig "$wifi_device" 2> /dev/null | grep "ESSID" | awk -F\" '{print $2}')
	echo $ssid
}

main() {
	local ssid=$(print_ssid "$1")
	echo "$ssid"
}
main
