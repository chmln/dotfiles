set hidden
set clipboard=unnamedplus
set ignorecase
set nowrap
set autoindent expandtab
set nobackup noswapfile
set termguicolors

" unbreak inotify
set nowritebackup

" disable intro msg
set shortmess+=I

" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" allow resizing splits with mouse
set mouse=a
nnoremap <LeftMouse> ma<LeftMouse>`a

" set correct working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" Multiple Cursors
Plug 'mg979/vim-visual-multi'
let g:VM_default_mappings = 1

Plug 'mboughaba/vim-lessmess'
let g:enable_lessmess_onsave = 0

Plug 'xi/vim-indent-detect'

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Yggdroot/indentLine'
"Plug 'lukas-reineke/indent-blankline.nvim'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_color_term = 33
"let g:indentLine_setConceal = 0

augroup misc
  au!
  au BufWritePre * LessmessExecute
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

" sane terminal/split setup
Plug 'vimlab/split-term.vim'
set splitright splitbelow
set fillchars=eob:\ ,stl:―,stlnc:―,vert:│
set statusline=%a

augroup splits
  au!
  au! ColorScheme * highlight StatusLine ctermbg=none ctermfg=0 | highlight StatusLineNC ctermbg=none ctermfg=0
augroup END

augroup termstuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber nocursorline
augroup END

" open external terminal
noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>
" open internal terminal
nmap <F5> :Term 20<CR>

Plug 'ryanoasis/vim-devicons'
