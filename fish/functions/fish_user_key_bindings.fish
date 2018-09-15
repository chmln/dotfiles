function fzf_selector
  fd -t "$argv" -H --exclude "node_modules" --exclude ".git" --exclude ".npm" --exclude ".rustup" | fzf --reverse --height=40%
end

function restore_state 
 set fish_bind_mode insert 
 commandline -f repaint
end

function fzf_edit 
  set target (fzf_selector "$argv")
	if [ -n "$target" ]
    eval "$EDITOR $target"
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
  nohup xterm >/dev/null 2>&1
end

function fish_user_key_bindings
	bind \co 'fzf_edit d'
	bind \cp 'fzf_edit f'
	bind \cn duplicate_term
	bind \cg fzf_cd
	bind \cb fzf_branch
	bind \ck fzf_kill
end

