#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit -- :1 -nolisten tcp vt$XDG_VTNR >> .xlog