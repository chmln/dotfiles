" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap Q q
nmap <silent> q :pclose<CR>
noremap <silent> <C-s> :w!<CR>
nnoremap <Tab> <C-W><C-W>

" Open Terminal
noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>


" Navigation/Find
map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>

" File Tree
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
