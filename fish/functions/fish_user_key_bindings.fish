function fzf_selector
  fd -aHF -d 6 $argv | sd -s "$HOME" '~' | fzf --height 30% --tiebreak=begin --preview "preview {}" | sd -s '~' "$HOME"
end

function restore_state
  commandline -f repaint
  set fish_bind_mode insert
end

function fzf_edit
  set target (fzf_selector -t $argv[1] "")
  begin
    if [ -n "$target" ]
      commandline -f repaint
      nvim "$target"
    end
  end
  restore_state
end

function fzf_cd
  set target (fzf_selector -t d -t s "" /)
  if [ -n "$target" ]
    cd "$target"
  end
  commandline -f up-line
  restore_state
end

function fzf_autocomplete
  set target (fzf_selector -t f -t d -t l "" /)
  if [ -n "$target" ]
    commandline -it -- (string escape $target)
  end
  restore_state
end

function duplicate_term
  nohup terminal >/dev/null 2>&1 &
end

function keybind
  bind $argv[1] $argv[2]
  bind -M insert $argv[1] $argv[2]
end

function fish_user_key_bindings
  if ! set -q NVIM_LISTEN_ADDRESS
    fish_vi_key_bindings
  end
  bind -M insert \cl forward-char
  bind -M insert \ck history-search-backward

  bind -M visual y fish_clipboard_copy
  bind -M default v visual_mode

  keybind \ca fzf_autocomplete
  keybind \cb fzf_branch
  keybind \ce nvim .
  keybind \cf lf
  keybind \cg fzf_cd
  keybind \cn duplicate_term
  keybind \co "fzf_edit d"
  keybind \cp "fzf_edit f"
  keybind \cx execute
end

# https://github.com/fish-shell/fish-shell/issues/3899
bind -M insert -k dc delete-char
bind -M default -k dc delete-char
