syntax on
set termguicolors
colorscheme onedark

set hidden
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set laststatus=2
set relativenumber
set nowrap
set nohlsearch

set clipboard=unnamedplus
let g:yankring_clipboard_monitor=0

set encoding=utf-8

set ignorecase
set smartcase

set nobackup
set noswapfile

set noshowcmd

" show buffer line
set showtabline=2
set noshowmode
set timeoutlen=1000 ttimeoutlen=0
set nofoldenable

" disable status line by default
set laststatus=0
set noruler

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']
let g:markdown_syntax_conceal = 1

let g:rustfmt_command = 'rustup run nightly rustfmt'
let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'typescript.tsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'jinja' : 1,
\}
