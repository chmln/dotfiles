# package management
alias get="yaourt -S"
alias r="sudo pacman -Rn"
alias rdd="sudo pacman -Rdd"
alias ditch="sudo pacman -Rnss"
alias findpkg="pacman -Qss"
alias updater="yaourt -Syua"
alias aur="yaourt"
alias rmall="sudo rmall"
alias maintenance="sudo paccache -ruk0 && sudo pacman -Rns $(pacman -Qtdq)"

# services
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias disable="sudo systemctl disable"
alias enable="sudo systemctl enable"
alias status="sudo systemctl status"
# misc
alias gs="git status"
alias c="clear"
alias sl="adb sideload"
alias mp3="lame --preset insane"

alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

l () {
  exa -1a --group-directories-first "$@"
}

zle -N l
