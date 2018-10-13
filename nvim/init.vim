set nocompatible

if has("nvim")
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'usr/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'brooth/far.vim'

Plug 'romainl/vim-qf'
Plug 'Valloric/MatchTagAlways'

Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'schickling/vim-bufonly'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'

" Syntax Highlighting
Plug 'soywod/typescript.vim'
Plug 'rust-lang/rust.vim'
Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'

call plug#end()

syntax on
set hidden
filetype plugin indent on
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nowrap
set nohlsearch

set clipboard=unnamedplus
let g:yankring_clipboard_monitor=0

" Encoding
set encoding=utf-8

" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

set nobackup
set noswapfile

set noshowcmd

" ====== APPEARANCE ====== "
set termguicolors
"let g:onedark_termcolors = 256
colorscheme onedark

" show buffer line
set showtabline=2
set noshowmode

let g:lightline = {
  \ "colorscheme": "one",
   \ 'enable': {
  \ 'statusline': 1,
  \ 'tabline': 1
  \ },
  \ "active": {
      \ "left": [["mode"], [ "gitbranch"]],
      \ "right": [['lineinfo', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
    \ },
  \ "tabline": {
    \ "left": [["buffers"]],
    \ "right": [[]],
  \ },
  \ "tab": {
    \ 'active': [ 'filename'],
    \ 'inactive': [ 'filename']
  \ },
  \ "component_expand": {
    \ 'buffers': 'lightline#bufferline#buffers',
    \  'linter_checking': 'lightline#ale#checking',
    \  'linter_warnings': 'lightline#ale#warnings',
    \  'linter_errors': 'lightline#ale#errors',
    \  'linter_ok': 'lightline#ale#ok',
  \ },
  \ "component_function": {
    \ 'gitbranch': 'LightlineGitBranch',
  \ },
  \ "component_type": {
    \ 'buffers': 'tabsel',
    \  'linter_checking': 'left',
    \  'linter_warnings': 'warning',
    \  'linter_errors': 'error',
    \  'linter_ok': 'left',
  \ },
\}
"  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"  \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':.:s?src/??:s?components/??:s?routes/??'

function! LightlineGitBranch()
  return "\ue0a0 ".gitbranch#name()
endfunction

" ====== TWEAKS ====== "
"let g:far#source="rg"

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set timeoutlen=1000 ttimeoutlen=0

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Disable folding because it's annoying.
set nofoldenable

" Keep cursor vertically centered
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" ====== PLUGINS ====== "
let g:ale_loclist_msg_format = "%s"
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 15
let g:ale_linters = {
\  'javascript': [],
\  'rust': ['rls']
\}

let g:ale_rust_rls_toolchain = 'stable'

let g:ale_fixers = {
\ 'typescript': ['prettier'],
\ 'rust': ['rustfmt']
\}

let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'typescript.tsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'jinja' : 1,
\}

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)"')"

command! Files call fzf#run(fzf#wrap({'source': 'fd -H --type f -E .git', 'options': '--reverse'}))

" Tab autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" hide line numbers for fzf and other terminal uis
if has("nvim")
  au TermOpen * setlocal nonumber norelativenumber
endif

" NERDTREE
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden=1

" Close if the only remaining window is a nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufReadPre,FileReadPre * :NERDTreeClose

" spell check markdown files
autocmd BufRead,BufNewFile *.md setlocal spell


" ====== KEYMAPS ====== "
noremap <Leader>q :bd<CR>
noremap <Leader>l :bn<CR>
noremap <Leader>h :bp<CR>

nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

map <C-p> :Files<CR>

noremap <F12> :ALEGoToDefinition<CR>
noremap <F11> :ALEDetail<CR>
noremap <F10> :ALENextWrap<CR>
noremap K :ALEHover<CR>

noremap <silent> <F4> :silent !nohup xterm >/dev/null 2>&1 &<CR>
"noremap <silent> <Esc> :noh<CR>
noremap <silent> <C-s> :w!<CR>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

tnoremap <Esc> <C-\><C-n>
if !has("nvim")
  imap <C-v> <ESC>"+pa
endif

nnoremap Q q
nmap <silent> q :pclose<bar>:cclose<CR>
