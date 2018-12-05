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
      eval $argv[2] "$target"
    end
  end
  restore_state
end

function fzf_cd
  set target (fzf_selector -t d)
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
  set target (git branch | sed 's/*/ /g' | sed 's/  //g' | fzf)
	if [ -n "$target" ]
    git checkout "$target"
  end
  restore_state
end

function fzf_kill
  set target (ps ax | fzf | cut -f1 -d ' ')
  if [ -n "$target" ]
    kill "$target"
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
	keybind \cp 'fzf_edit f rifle'
	keybind \cn duplicate_term
	keybind \cg fzf_cd
	keybind \ca fzf_autocomplete
	keybind \cb fzf_branch
	keybind \ck fzf_kill
  keybind \cf ranger

end

