Plug 'neoclide/coc.nvim', {'branch': 'release'}

" show function signature
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync('doHover')<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
