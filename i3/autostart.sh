#!/bin/sh

screens

# wallpapers
feh --no-fehbg --bg-scale ~/.config/wallpaper ~/.config/wallpaper

# bar
sh ~/.config/i3/polybar.sh

# force turn on numlock
numlockx on &

# disable bells
xset -b

# disable power saving for mice
xset s off -dpms

# keyboard repeat rate
xset r rate 250 85

# russian keyboard
setxkbmap -option grp:win_space_toggle us,ru ,phonetic_winkeys &

# load xresources
xrdb ~/.config/x11/xresources &

devmon &

# automatic tiling
systemctl --user start i3-auto-layout &

# set dark gtk theme after sunset
systemctl --user start dark-mode &

# blue light filter
systemctl --user start redshift &

# connect to bluetooth speakers
systemctl --user start bluetooth-speakers &

# remote media control
systemctl --user start volume-control &

# auto-mount plugged in usb devices
systemctl --user start devmon &
