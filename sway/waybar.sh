#!/usr/bin/env sh
dir="/home/greg/.dotfiles/sway/waybar"
config="$dir/config"
style="$dir/style.css"

# Terminate already running bar instances
killall -q waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# Launch waybar
waybar -c $config -s $style &
