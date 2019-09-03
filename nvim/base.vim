" tame the quickfix window
Plug 'romainl/vim-qf'

" remove trailing whitespace
Plug 'KorySchneider/vim-trim'
autocmd BufWritePre * :Trim

" Keep cursor vertically centered
au BufEnter * let &scrolloff=winheight(win_getid())

" Update buffer on external changes
"au FocusGained,BufEnter * :silent! !
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" open terminal
noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>
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
