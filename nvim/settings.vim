set hidden
set number
set expandtab
set laststatus=2
set relativenumber
set nowrap
set nohlsearch

set nomodeline

set complete-=i

set clipboard=unnamedplus
let g:yankring_clipboard_monitor=0

set encoding=utf-8

set ignorecase
set smartcase

set nobackup
set noswapfile

set showtabline=0
set noshowcmd
set noshowmode
set timeoutlen=1000 ttimeoutlen=0
set nofoldenable

" disable status line by default
set laststatus=0
set noruler

" set cursors for xterm
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
