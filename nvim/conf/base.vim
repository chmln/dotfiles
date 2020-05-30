set hidden
set clipboard=unnamedplus
set ignorecase
set nowrap
set autoindent expandtab
set nobackup noswapfile
" unbreak inotify
set nowritebackup
" disable intro msg
set shortmess=I

" allow resizing splits with mouse
set mouse=a

" set correct working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/', 'Cargo.toml']
let g:rooter_silent_chdir = 1

Plug 'axelf4/vim-strip-trailing-whitespace'

Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'ciaranm/securemodelines'
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

Plug 'ryanoasis/vim-devicons'

" sane terminal setup
Plug 'vimlab/split-term.vim'
set splitright splitbelow
augroup termstuff
  au!
  autocmd TermEnter * setlocal nonumber norelativenumber
augroup END

" open external terminal
noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>
" open internal terminal
nmap <F5> :Term 20<CR>
