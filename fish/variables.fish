# remove ? interpretation as glob
set -U fish_features qmark-noglob

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

# fish customizations
set -x fish_greeting
set fish_cursor_default block
set fish_cursor_insert line

set -U fish_color_autosuggestion brblack
set -U fish_color_cancel -r
set -U fish_color_command white
set -U fish_color_comment brmagenta
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end brmagenta
set -U fish_color_error brblack
set -U fish_color_escape brcyan
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator cyan
set -U fish_color_param white
set -U fish_color_quote green
set -U fish_color_redirection white
set -U fish_color_search_match 'bryellow' '--background=brblack'
set -U fish_color_selection 'white' '--bold' '--background=brblack'
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion normal --bold
set -U fish_pager_color_description brwhite
set -U fish_pager_color_prefix 'white' '--bold' '--underline'
set -U fish_pager_color_progress 'brwhite' '--background=cyan'
