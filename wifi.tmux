#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

wifi_interpolation=(
	"\#{wifi_percentage}"
	"\#{wifi_bg_color}"
	"\#{wifi_fg_color}"
	"\#{wifi_graph}"
	"\#{wifi_ssid}"
    "\#{wifi_ascii}"
    "\#{wifi_ascii_char}"
)

wifi_commands=(
	"#($CURRENT_DIR/scripts/wifi_percentage.sh)"
	"#($CURRENT_DIR/scripts/wifi_bg_color.sh)"
	"#($CURRENT_DIR/scripts/wifi_fg_color.sh)"
	"#($CURRENT_DIR/scripts/wifi_graph.sh)"
	"#($CURRENT_DIR/scripts/wifi_ssid.sh)"
    "#($CURRENT_DIR/scripts/wifi_ascii.sh)"
)

set_tmux_option() {
	local option=$1
	local value=$2
	tmux set-option -gq "$option" "$value"
}

do_interpolation() {
	local all_interpolated="$1"
	for ((i=0; i<${#wifi_commands[@]}; i++)); do
		all_interpolated=${all_interpolated/${wifi_interpolation[$i]}/${wifi_commands[$i]}}
	done
	echo "$all_interpolated"
}

update_tmux_option() {
	local option=$1
	local option_value=$(get_tmux_option "$option")
	local new_option_value=$(do_interpolation "$option_value")
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
