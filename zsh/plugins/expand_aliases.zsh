globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}

expandeval() {
  zle _expand_alias
  zle expand-word
  zle accept-line
}

zle -N globalias
zle -N expandeval

bindkey -M viins " " globalias
bindkey "^M" expandeval

# control-space to make a normal space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space
