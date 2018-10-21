fzf_selector () {
  fd -t "$1" -F -p -H --max-depth 10 | fzf --reverse --height=40%
}

restore_state () {
  vcs_info
 zle reset-prompt
}

fzf_edit () {
  target=$(fzf_selector "$1")
  if [ -n "$target" ]; then
    $2 $target
  fi 
  restore_state
}

fzf_cd() {
  target=$(fzf_selector "d")
  if [ -n "$target" ]; then
    cd "$target"
  fi 
  restore_state
}

fzf_branch() {
  target=$(git branch | sed 's/*/ /g' | sed 's/  //g' | fzf)
  if [ -n "$target" ]; then
    git checkout "$target"
  fi
  restore_state
}

fzf_kill() {
  target=$(ps ax | fzf | cut -f1 -d ' ')
  if [ -n "$target" ]; then
    kill -s KILL $target
  fi
  restore_state
}

duplicate_term () {
  nohup xterm >/dev/null 2>&1 &
}

open_dir () {
  fzf_edit d nvim
}

open_file () {
  fzf_edit f xdg-open
}

bindkey -v

zle -N open_dir
zle -N open_file
zle -N duplicate_term
zle -N fzf_cd
zle -N fzf_branch
zle -N fzf_kill
bindkey '^O' open_dir
bindkey '^P' open_file
bindkey '^N' duplicate_term
bindkey '^G' fzf_cd
bindkey '^B' fzf_branch
bindkey '^K' fzf_kill

