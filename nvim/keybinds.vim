nmap <leader>rn <Plug>(coc-rename)
noremap <Leader>q :bd<CR>
noremap <Leader>l :bn<CR>
noremap <Leader>h :bp<CR>

nmap <silent> <F12> <Plug>(coc-definition)
nmap <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap K :call CocAction('doHover')<CR>

noremap <silent> <F4> :silent !nohup xterm >/dev/null 2>&1 &<CR>
noremap <silent> <C-s> :w!<CR>

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

tnoremap <Esc> <C-\><C-n>

nnoremap Q q
nmap <silent> q :pclose<bar>:cclose<CR>
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
