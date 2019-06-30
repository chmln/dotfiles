Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bogado/file-line'

" show function signature
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> <F12> <Plug>(coc-definition)
nmap <silent> <F11> :call CocAction("diagnosticInfo")<CR>
nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync('doHover')<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
