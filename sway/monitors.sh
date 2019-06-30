#!/bin/fish
set -l num_monitors (swaymsg -t get_outputs | jq -r '. | length')

if [ $num_monitors -gt 1 ]
  swaymsg "output eDP-1 pos 320 1440 mode 1920x1080"
  swaymsg "output HDMI-A-1 pos 0 0 mode 2560x1440"
end

