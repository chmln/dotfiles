" set correct working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

Plug 'ciaranm/securemodelines'
Plug 'KorySchneider/vim-trim'
Plug 'xi/vim-indent-detect'

" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap Q q
nmap <silent> q :pclose<CR>
noremap <silent> <C-s> :w!<CR>
nnoremap <Tab> <C-W><C-W>

augroup misc
  au!
  au BufWritePre * :Trim

  " Keep cursor vertically centered
  au BufEnter * let &scrolloff=winheight(win_getid())

  " Update buffer on external changes
  au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  au FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
