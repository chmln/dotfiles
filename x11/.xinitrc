[ -f /etc/xprofile ] && source /etc/xprofile
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

xset -b
xset s off -dpms

eval $(dbus-launch --sh-syntax)

export GTK_OVERLAY_SCROLLING=0
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_CSD=0
export LD_PRELOAD="/usr/lib/libgtk3-nocsd.so.0"

exec i3
