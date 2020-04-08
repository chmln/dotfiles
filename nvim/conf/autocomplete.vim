Plug 'neoclide/coc.nvim', {'branch': 'release'}

augroup coc
    au!
    " show function signature
    au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync('doHover')<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
