function fzf_selector
  fd -H -F -p --max-depth 10 $argv | fzf --reverse --height=40%
end

function restore_state
 commandline -f repaint
 set fish_bind_mode insert
end

function fzf_edit
  set target (fzf_selector -t $argv[1])
  begin
    if [ -n "$target" ]
      commandline -f repaint
      $argv[2] "$target"
    end
  end

  if [ -n "$argv[3]" ]
    echo $argv[3]
    $argv[3]
  end
  restore_state
end

function fzf_cd
  set target (fzf_selector -t d "" /)
	if [ -n "$target" ]
    cd "$target"
  end
  restore_state
end

function fzf_autocomplete
  set target (fzf_selector -t f -t d "" /)
	if [ -n "$target" ]
    commandline -it -- (string escape $target)
  end
  restore_state
end

function fzf_branch
  set target (git branch | sd "[* ]" "" | fzf)
	if [ -n "$target" ]
    git checkout "$target"
  end
  restore_state
end

function fzf_kill
  set target (ps ax | fzf | sd '^\s+' '' | cut -f1 -d ' ')
  if [ -n "$target" ]
    echo $target
    kill "$target"
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
  keybind \co "fzf_edit d $EDITOR"
	keybind \cp "fzf_edit f $EDITOR"
	keybind \cs "fzf_edit f xdg-open exit"
	keybind \cn duplicate_term
	keybind \cg fzf_cd
	keybind \ca fzf_autocomplete
	keybind \cb fzf_branch
	keybind \ck fzf_kill
  keybind \cf ranger
end

# https://github.com/fish-shell/fish-shell/issues/3899
bind -M insert -k dc delete-char
bind -M default -k dc delete-char
