#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

BROWSER=/usr/bin/google-chrome-unstable
EDITOR=/usr/bin/nano
GUI_EDITOR=subl3
export FM="pcmanfm"

PATH=$PATH:/home/greg/.config/bin
export PATH

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

export PS1="\[\033[38;5;11m\]\u@\[$(tput sgr0)\]\[\033[38;5;5m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]>\[$(tput sgr0)\]"

# package management
alias get="sudo pacman -S"
alias r="sudo pacman -Rn"
alias rmpkg="sudo pacman -R"
alias rdd="sudo pacman -Rdd"
alias ditch="sudo pacman -Rnss"
alias findpkg="pacman -Qss"
alias updater="yaourt -Syu --aur"
alias aur="yaourt"
alias rmall="sudo rmall"
alias maintain="$(pacman -Qtdq) | while read p; do sudo pacman -R $p; done && sudo pacman -Sc"

# services
alias start="sudo systemctl start"
alias restart="sudo systemctl restart"
alias stop="sudo systemctl stop"
alias disable="sudo systemctl disable"
alias enable="sudo systemctl enable"

# editing
alias e="sudo $GUI_EDITOR"
alias ee="$GUI_EDITOR"

# misc
alias c="clear"
alias sl="adb sideload"
alias utm="ssh petrosy1@dh2020pc01.utm.utoronto.ca"
alias mp3="lame --preset insane"
alias findext="find $directory -type f -name"

alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
