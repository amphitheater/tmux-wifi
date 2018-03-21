#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_wifi_quality() {
    dbm=$(cat /proc/net/wireless | awk 'END { print $4}' | sed 's/\.$//')
    if [ $dbm -le -100 ]; then
        quality=0
    fi
    if [ $dbm -ge -50 ]; then
        quality=100
    else
        quality=$((2 * ($dbm + 100)))
    fi
    echo $quality
}

main() {
	print_wifi_quality
}
main
