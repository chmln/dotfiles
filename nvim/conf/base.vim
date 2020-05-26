set hidden
set clipboard=unnamedplus
set ignorecase
set autoindent expandtab
set nobackup noswapfile
" unbreak inotify
set nowritebackup

" set correct working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/', 'Cargo.toml']
let g:rooter_silent_chdir = 1

" extended language support
Plug 'sheerun/vim-polyglot'
"Plug 'nvim-treesitter/nvim-treesitter'

" zen mode
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
" neuter modelines
Plug 'ciaranm/securemodelines'
" auto detect indentation
Plug 'xi/vim-indent-detect'

augroup misc
  au!
  " Update buffer on external changes
  au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
augroup END

" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap Q q
noremap <silent> <C-s> :w!<CR>
nnoremap <Tab> <C-W><C-W>

noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>
