#!/bin/sh -e
# Set the color scheme of gnome-terminal to match Jellybeans

PROFILE=Default
CONF_TOOL=gconftool-2
CONF_PATH="/apps/gnome-terminal/profiles/$PROFILE"

$CONF_TOOL -s -t string "$CONF_PATH/foreground_color" \#E8E8D3
$CONF_TOOL -s -t string "$CONF_PATH/background_color" \#151515
$CONF_TOOL -s -t string "$CONF_PATH/bold_color" \#FFFFFF

# Make sure we aren't using the system theme
$CONF_TOOL -s -t bool "$CONF_PATH/use_theme_colors" false
$CONF_TOOL -s -t bool "$CONF_PATH/bold_color_same_as_fg" false
