# tmux wifi status

Displays wifi status with spark or ascii on status bar.

## Installation
#### Optional requirements
`spark` for displaying the graph - adapted from [nhhagen/wifi](https://github.com/nhhagen/wifi)

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Clone the repo:

    $ git clone https://github.com/amphitheater/tmux-wifi ~/.tmux/plugins/tmux-wifi

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin `tmux-plugins/tmux-wifi'

Hit `prefix + I` to fetch the plugin and source it.

### Manual installation

Clone the repo:

    $ git clone https://github.com/amphitheater/tmux-wifi ~/.tmux/plugins/tmux-wifi

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/cpu.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

### Usage
Format strings available:
- `#{wifi_graph}` - will show connection quality represented by the middle bar of spark 0 <connection quality> 100 (for example, a connection quality of 60 will get ▁▅█ from spark and display just ▅)
- `#{wifi_ssid}` - will show the ssid of the active wifi connection
- `#{wifi_percentage}` - will show wifi percentage
- `#{wifi_ascii}` - will display three characters (depending on connection quality of high, medium, low).
	- `#{wifi_ascii_char}` Sets the asci character - default is +++ (the format is three characters until I learn bash, as the script just prints a substring)
- The following options control the foreground and background of low, medium, and high wifi connection quality
	- `#{wifi_low_fg_color}`
	- `#{wifi_medium_fg_color}`
	- `#{wifi_high_fg_color}`
	- `#{wifi_low_bg_color}`
	- `#{wifi_medium_bg_color}`
	- `#{wifi_high_bg_color}`

#### ~/.tmux.conf
```
set -g status-right "#{wifi_ssid}#{wifi_fg_color] [#{wifi_percentage}%] #{wifi_graph}"
```

Personally, in the interest of having a cleaner `.tmux.conf`, I've merged settings for all plugins in a settings file: `~/.tmux/plugins/tmux-settings.conf` and sourced from `~/.tmux.conf` with the line `source-file ~/.tmux/plugins/tmux-settings.conf`, `source-file ~/.tmux/keybindings.conf`, etc.

#### ~/.tmux/plugins/tmux-settings.conf
```
set -g @wifi_low_fg_color "#[fg=#ff0000]"
set -g @wifi_medium_fg_color "#[fg=#ffff00]"
set -g @wifi_high_fg_color "#[fg=#00ff00]"

set -g @wifi_low_bg_color "#[bg=#000000]"
set -g @wifi_medium_bg_color "#[bg=#000000]"
set -g @wifi_high_bg_color "#[bg=#000000]"

set -g @cpu_low_bg_color "#[fg=#ff0000]"
[...]
```

#### Examples:
Strong connection quality with graph and ascii:

![wifi full](/screenshots/wifi-full.png)