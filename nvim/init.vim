set runtimepath+=~/.dotfiles/nvim

call plug#begin('~/.local/share/nvim/plugged')

runtime ./base.vim
runtime ./settings.vim

runtime ./file_tree.vim
"runtime ./bufline.vim
runtime ./statusbar.vim

runtime ./autocomplete.vim
runtime ./project-file-tools.vim
runtime ./extras.vim
runtime ./syntax.vim
runtime ./terminal.vim
runtime ./focus.vim

call plug#end()

colorscheme onedark
