[ -f /etc/xprofile ] && source /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

xset -b
xset s off -dpms

#setxkbmap -option grp:switch,grp:lalt_lshift_toggle us,ru ,phonetic_winkeys

eval $(dbus-launch --sh-syntax)

export GTK_OVERLAY_SCROLLING=0
export QT_QPA_PLATFORMTHEME="qt5ct"

exec i3
