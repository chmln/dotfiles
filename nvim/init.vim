set nocompatible

if has("nvim")
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

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

set shell=/bin/bash

syntax on
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

" Encoding
set encoding=utf-8

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
      \ "right": [['cocstatus', 'lineinfo' ]]
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
  \ },
  \ "component_function": {
    \ 'gitbranch': 'LightlineGitBranch',
    \ 'cocstatus': 'coc#status'
  \ },
  \ "component_type": {
    \ 'buffers': 'tabsel',
  \ },
\}

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':.:s?src/??:s?components/??:s?routes/??'

function! LightlineGitBranch()
  return "\ue0a0 ".gitbranch#name()
endfunction

" ====== TWEAKS ====== "
let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \ fzf#vim#with_preview(),
  \ <bang>0)

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']
let g:markdown_syntax_conceal = 1

let g:rustfmt_command = 'rustup run nightly rustfmt'

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

" Update buffer on external changes
au FocusGained,BufEnter * :silent! !

" ====== PLUGINS ====== "
let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'typescript.tsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\ 'jinja' : 1,
\}

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
function SetupMarkdown()
  setlocal spell 
  setlocal lbr
  set wrap
  Goyo 80
  nnoremap j gj
  vnoremap j gj
  nnoremap k gk
  vnoremap k gk
endfunction

autocmd BufRead,BufNewFile *.md call SetupMarkdown()

" ====== KEYMAPS ====== "

" Show signature help while editing
autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
noremap <Leader>q :bd<CR>
noremap <Leader>l :bn<CR>
noremap <Leader>h :bp<CR>

nmap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

map <C-p> :Files<CR>
map <C-f> :Rg<CR>

nmap <silent> <F12> <Plug>(coc-definition)
nmap <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap K :call CocAction('doHover')<CR>

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
inoremap <silent><expr> <c-space> coc#refresh()
