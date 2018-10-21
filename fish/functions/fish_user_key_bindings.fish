function fzf_selector
  fd -t "$argv" -H -F -p --max-depth 10 | fzf --reverse --height=40%
end

function restore_state 
 set fish_bind_mode insert 
 commandline -f repaint
end

function fzf_edit 
  set target (fzf_selector "$argv[1]")
	if [ -n "$target" ]
    eval "$argv[2] $target"
  end
  restore_state
end

function fzf_cd
  set target (fzf_selector "d")
	if [ -n "$target" ]
    cd "$target"
  end
  restore_state
end

function fzf_branch
  set target (git branch | sed 's/*/ /g' | sed 's/  //g' | fzf)
	if [ -n "$target" ]
    git checkout "$target"
  end
  restore_state
end

function fzf_kill
  set target (ps ax | fzf | cut -f1 -d ' ')
  if [ -n "$target" ]
    sudo kill "$target"
  end
  restore_state
end

function duplicate_term
  nohup xterm >/dev/null 2>&1 &
end

function keybind
  bind $argv[1] $argv[2]
  bind -M insert $argv[1] $argv[2]
end

function fish_user_key_bindings
  keybind \co 'fzf_edit d $EDITOR'
	keybind \cp 'fzf_edit f xdg-open'
	keybind \cn duplicate_term
	keybind \cg fzf_cd
	keybind \cb fzf_branch
	keybind \ck fzf_kill
end

function fish_right_prompt
end
