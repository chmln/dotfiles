" tame the quickfix window
Plug 'romainl/vim-qf'

" better hlsearch
Plug 'romainl/vim-cool'

" remove trailing whitespace and >1 newlines at eof on save
Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

" Keep cursor vertically centered
au BufEnter * let &scrolloff=winheight(win_getid())

" Update buffer on external changes
au FocusGained,BufEnter * :silent! !

" open terminal
noremap <silent> <F4> :silent !nohup xterm >/dev/null 2>&1 &<CR>
noremap <silent> <C-s> :w!<CR>

" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" q closes any extra panels
nnoremap Q q
nmap <silent> q :pclose<bar>:cclose<CR>
