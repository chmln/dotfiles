#!/usr/bin/env sh

pkill pnmixer
pkill albert
pkill nm-applet
pkill redshift
pkill udiskie
pkill pnmixer

# monitors
auto-monitor

# wallpapers
nitrogen --set-scaled ~/.config/wallpaper --head=0
nitrogen --set-scaled ~/.config/wallpaper --head=1

# bar
sh /home/greg/.config/i3/polybar.sh

#numlock on
numlockx on &

#disable mouse accel
xset m 0 0 &
# keyboard repeat rate
xset r rate 300 50
#setxkbmap -option grp:switch,grp:lalt_lshift_toggle us,ru ,phonetic_winkeys &

# apps
xrdb /home/greg/.Xresources &
gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh &
pnmixer &
evolution &
nm-applet &
redshift -c /home/greg/.config/redshift.conf &
albert &
udiskie &
sleep 5 && slack-auto &
