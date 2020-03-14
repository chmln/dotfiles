function e
  set -l path (realpath $argv[1])
  sudoedit $path
end

function l
  env COLUMNS=80 exa -a -1 --group-directories-first $argv --color=always | less -FR
end

function cat
  /usr/bin/bat --style plain $argv
end

function maintenance
  sudo paccache -ruk0

  if set -l pkgs (pacman -Qtdq)
     sudo pacman -Rns --noconfirm $pkgs
  end
end

function updater
  yay -Syu $argv[1] --noconfirm
  maintenance
  return 0
end

# disable right prompt, if any
function fish_right_prompt
end

function fish_greeting
end

function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  if $IS_DAY
    __bobthefish_colors terminal-light-black
    set -U fish_color_command 000000
    set -U fish_color_quote 626262
    set -U fish_color_redirection 8a8a8a
    set -U fish_color_end 767676
    set -U fish_color_error b2b2b2
    set -U fish_color_param 303030
    set -U fish_color_comment 4e4e4e
    set -U fish_color_match --background=brblue
    set -U fish_color_selection white --bold --background=brblack
    set -U fish_color_search_match bryellow --background=brblack
    set -U fish_color_history_current --bold
    set -U fish_color_operator 00a6b2
    set -U fish_color_escape 00a6b2
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 777777
    set -U fish_color_cancel -r
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D yellow
    set -U fish_pager_color_prefix white --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan

    set -x color_path cccccc 333333
    set -x color_path_basename cccccc 333333 --bold

    set -x color_path_nowrite cccccc 333333
    set -x color_path_nowrite_basename cccccc 333333 --bold
    set -x color_repo_dirty FFDAC2 white
  else
    __bobthefish_colors terminal-dark
    set -U fish_color_command ffffff
    set -U fish_color_quote a8a8a8
    set -U fish_color_redirection 808080
    set -U fish_color_end 949494
    set -U fish_color_error 585858
    set -U fish_color_param d7d7d7
    set -U fish_color_comment bcbcbc
    set -U fish_color_match --background=brblue
    set -U fish_color_selection white --bold --background=brblack
    set -U fish_color_search_match bryellow --background=brblack
    set -U fish_color_history_current --bold
    set -U fish_color_operator 00a6b2
    set -U fish_color_escape 00a6b2
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 777777
    set -U fish_color_cancel -r
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D yellow
    set -U fish_pager_color_prefix white --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan
    set -x color_path_nowrite black white
    set -x color_path_nowrite_basename black white --bold
    set -x color_repo_dirty yellow 333333
  end

end

function visual_mode
  commandline -f forward-char
  set fish_bind_mode visual
  commandline -f begin-selection
end

function fish_clipboard_copy
    set -l cmdline (commandline --current-selection)
    test -n "$cmdline"; or set cmdline (commandline)
    printf '%s\n' $cmdline | xsel -b >/dev/null

    commandline -f end-selection
    set fish_bind_mode insert
    commandline -f end-of-line
    commandline -f repaint
end

