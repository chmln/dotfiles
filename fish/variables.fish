# remove ? interpretation as glob
set fish_features qmark-noglob

if systemctl --user show-environment | rg -q IS_DAY=true
 set -gx IS_DAY true
else
 set -gx IS_DAY false
end

if $IS_DAY
 set -gx BAT_THEME "OneHalfLight"
 set -gx FZF_DEFAULT_OPTS "--reverse --color=light"
else
 set -gx BAT_THEME "TwoDark"
 set -gx FZF_DEFAULT_OPTS "--reverse"
end

set -gx KUBE_HOME /home/greg/.local/share/kube
set -gx MINIKUBE_HOME /home/greg/.local/share/minikube
set -gx KUBECONFIG $KUBE_HOME/config

# fish customizations
set -x fish_greeting
set fish_cursor_default block
set fish_cursor_insert line

set -x fish_color_autosuggestion brblack
set -x fish_color_cancel -r
set -x fish_color_command white
set -x fish_color_comment brmagenta
set -x fish_color_cwd green
set -x fish_color_cwd_root red
set -x fish_color_end brmagenta
set -x fish_color_error brblack
set -x fish_color_escape brcyan
set -x fish_color_history_current --bold
set -x fish_color_host normal
set -x fish_color_match --background=brblue
set -x fish_color_normal normal
set -x fish_color_operator cyan
set -x fish_color_param white
set -x fish_color_quote green
set -x fish_color_redirection white
set -x fish_color_search_match 'bryellow' '--background=brblack'
set -x fish_color_selection 'white' '--bold' '--background=brblack'
set -x fish_color_status red
set -x fish_color_user brgreen
set -x fish_color_valid_path --underline
set -x fish_pager_color_completion normal --bold
set -x fish_pager_color_description brwhite
set -x fish_pager_color_prefix 'white' '--bold' '--underline'
set -x fish_pager_color_progress 'brwhite' '--background=cyan'

if set -q NVIM_LISTEN_ADDRESS
    set -gx fish_color_command #000000
    set -gx fish_color_param #000000
    set -gx fish_color_error #777777
end
