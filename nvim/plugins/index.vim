call plug#begin('~/.local/share/nvim/plugged')

Plug 'usr/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'yuki-ycino/fzf-preview.vim'

Plug 'brooth/far.vim'

Plug 'romainl/vim-qf'
Plug 'Valloric/MatchTagAlways'

Plug 'airblade/vim-rooter'
Plug 'bogado/file-line'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'Shougo/echodoc.vim'

Plug 'schickling/vim-bufonly'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'

" Markdown
Plug 'junegunn/goyo.vim'

" Syntax Highlighting
Plug 'soywod/typescript.vim'
Plug 'rust-lang/rust.vim'
Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'mboughaba/i3config.vim'

call plug#end()

runtime plugins/file_tree.vim
runtime plugins/fzf.vim
runtime plugins/statusbar.vim
