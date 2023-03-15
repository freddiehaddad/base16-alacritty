#!/usr/bin/env bash

# ----------------------------------------------------------------------
# Setup config variables and env
# ----------------------------------------------------------------------

# Allow users to optionally configure their alacritty theme path and set the
# value if one doesn't exist. This runs each time a script is switched
# so it's important to check for previously set values.

if [ -z "$BASE16_SHELL_ALACRITTY_CONF_PATH" ]; then
	BASE16_SHELL_ALACRITTY_CONF_PATH="$HOME/.config/alacritty/alacritty.yml"
fi

if [ -z "$BASE16_SHELL_ALACRITTY_THEME_PATH" ]; then
	BASE16_SHELL_ALACRITTY_THEME_PATH="$HOME/.config/base16-alacritty/colors"
fi

# If base16-alacritty path directory doesn't exist, stop hook
if [ ! -d "$BASE16_SHELL_ALACRITTY_THEME_PATH" ]; then
	echo "base16-theme directory not found"
	return 2
fi

# If base16-alacritty configuration file doesn't exist, stop hook
if [ ! -f "$BASE16_SHELL_ALACRITTY_CONF_PATH" ]; then
	echo "alacritty.yml not found"
	return 2
fi

# ----------------------------------------------------------------------
# Execution
# ----------------------------------------------------------------------

# If base16-alacritty is used, provide a file for base16-alacritty to source
if [ -d "$BASE16_SHELL_ALACRITTY_THEME_PATH" ]; then
	# Set current theme name
	read -r current_theme_name <"$BASE16_SHELL_THEME_NAME_PATH"
	theme_file="$BASE16_SHELL_ALACRITTY_THEME_PATH/base16-$current_theme_name.yml"
	start='^###BASE16_START###$'
	end='^###BASE16_END###$'
	# r insert_file command must be the last thing on its line
	sed -i -e "/$start/,/$end/{ /$start/{p; r $theme_file
        }; /$end/p; d }" "$BASE16_SHELL_ALACRITTY_CONF_PATH"
fi
