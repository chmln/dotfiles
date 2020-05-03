almel init fish | source

function e
  sudoedit (realpath $argv[1])
end

function l
  env COLUMNS=80 exa -a -1 --group-directories-first $argv --color=always | less -FR
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

#function fish_prompt
#    almel prompt fish -s$status -j(count (jobs -p)) -d(math $CMD_DURATION / 1000)
#end

function fish_right_prompt
end

function fish_mode_prompt
end

function fish_greeting
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
