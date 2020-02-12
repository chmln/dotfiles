# package management
abbr -a get "yay -S"
abbr -a r "sudo pacman -Rn"
abbr -a rdd "sudo pacman -Rdd"
abbr -a findpkg "pacman -Qss"
abbr -a aur "yay"
abbr -a rmall "sudo rmall"

# systemd-os
abbr -a start "sudo systemctl start"
abbr -a restart "sudo systemctl restart"
abbr -a stop "sudo systemctl stop"
abbr -a disable "sudo systemctl disable"
abbr -a enable "sudo systemctl enable"
abbr -a status "sudo systemctl status"
abbr -a sysu "systemctl --user"

# misc
abbr -a c "clear"
abbr -a gs "git status"
abbr -a gd "git diff"
abbr -a sl "adb sideload"
abbr -a update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
