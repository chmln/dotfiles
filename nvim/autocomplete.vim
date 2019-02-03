Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'Shougo/echodoc.vim'
Plug 'bogado/file-line'

autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap K :call CocAction('doHover')<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
