# Set config root
DOTS="/home/greg/.dotfiles/zsh"

source "$DOTS/path.zsh"
export EDITOR=nvim

# Prompt
source "$DOTS/prompt.zsh"
precmd_functions+=(prompt_agnoster_precmd)

# History
HISTFILE=~/.config/zsh/history
SAVEHIST=10000
HISTSIZE=10000
setopt APPEND_HISTORY

# Keybinds
source "$DOTS/vim_mode.zsh"
source "$DOTS/keybinds.zsh"
source "$DOTS/abbreviations.zsh"

# Start X on login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# Syntax Highlighting
export FAST_WORK_DIR="$DOTS/syntax"
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Autocomplete
CASE_SENSITIVE="false"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.config/zsh/cache
autoload -U compinit && compinit

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
ZSH_AUTOSUGGEST_USE_ASYNC=y

# Fish-like history search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Auto-expand aliases on space
source "$DOTS/plugins/expand_aliases.zsh"


