set runtimepath+=~/.dotfiles/nvim

call plug#begin('~/.local/share/nvim/plugged')

runtime ./base.vim
runtime ./settings.vim

runtime ./file_tree.vim

runtime ./autocomplete.vim
runtime ./project-file-tools.vim
runtime ./extras.vim
runtime ./focus.vim
runtime ./syntax.vim
runtime ./terminal.vim

call plug#end()

colorscheme onedark
