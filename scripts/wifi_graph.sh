#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_graph() {
	local wifi_percentage=$($CURRENT_DIR/wifi_percentage.sh)
	sparks=$(spark 0 ${wifi_percentage} 100)
	graph=${sparks:1:1}
	echo $graph
}

main() {
	local wifi_graph=$(print_graph "$1")
	echo "$wifi_graph"
}
main
