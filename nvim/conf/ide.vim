Plug 'neoclide/coc.nvim', {'do': 'npm i'}
Plug 'neoclide/coc-tsserver', {'do': 'npx yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'npx yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'npm i'}
Plug 'weirongxu/coc-explorer', {'do': 'npx yarn install --frozen-lockfile'}

set updatetime=300
set shortmess+=c

nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync("doHover")<CR>
nmap <silent> <F12> <Plug>(coc-definition)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>f :CocCommand explorer<CR>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType rust highlight CocRustChainingHint ctermfg=gray
augroup END

" Code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm i' }
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
let g:rustfmt_autosave_if_config_present = 1

augroup Fmt
  au!
  au! BufWritePre * StripTrailingWhitespace
  au! BufWritePre *.js,*.json,*.css,*.scss,*.less,*.ts,*.tsx PrettierAsync
augroup END


Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }

" Navigation
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = v:false
map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>

" Multiple Cursors
Plug 'mg979/vim-visual-multi'
let g:VM_default_mappings = 1

" File Tree
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
