set runtimepath+=~/.dotfiles/nvim

call plug#begin('~/.local/share/nvim/plugged')

runtime ./base.vim
runtime ./settings.vim

runtime ./file_tree.vim

runtime ./autocomplete.vim
runtime ./project_navigation.vim
runtime ./extras.vim
runtime ./markdown.vim
runtime ./lang_support.vim
runtime ./terminal.vim
runtime ./text_edit_tools.vim

call plug#end()

colorscheme onedark
