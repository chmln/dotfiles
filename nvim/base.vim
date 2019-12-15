" set correct working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" remove trailing whitespace
Plug 'KorySchneider/vim-trim'
autocmd BufWritePre * :Trim

" detect indentation
Plug 'tpope/vim-sleuth'

" Keep cursor vertically centered
au BufEnter * let &scrolloff=winheight(win_getid())

" Update buffer on external changes
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" open terminal
noremap <silent> <C-s> :w!<CR>

" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" q closes any extra panels
nnoremap Q q
nmap <silent> q :pclose<bar>:cclose<CR>

" splits
nnoremap <Tab> <C-W><C-W>
