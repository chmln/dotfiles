Plug 'neoclide/coc.nvim', {'do': 'yarn'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn'}
Plug 'neoclide/coc-json', {'do': 'yarn'}
Plug 'clangd/coc-clangd', {'do': 'yarn'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn'}
nnoremap <silent> <leader>f :CocCommand explorer<CR>

Plug 'nvim-treesitter/nvim-treesitter'

" lsp tags / classes / functions / etc
Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 1
let g:vista_ignore_kinds = ['Property', 'Field', 'EnumMember']

set updatetime=300
set shortmess+=c

nmap <silent> <leader>p <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync("doHover")<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm i' }
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_options="--edition 2018"
let g:rustfmt_command="rustup run nightly rustfmt"

augroup Fmt
  au!
  au! BufWritePre *.js,*.json,*.css,*.scss,*.less,*.ts,*.tsx PrettierAsync
  au! BufWritePre *.c call CocActionAsync("format")
augroup END

"Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
"nnoremap <silent> <leader>f :CHADopen<CR>

Plug 'kdheepak/lazygit.vim', { 'on': 'LazyGit', 'branch': 'nvim-v0.4.3' }
nmap <leader>g :LazyGit<CR>

" Navigation
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_preview_window = 'right:40%'

map <silent><C-p> :Files<CR>
map <silent><C-f> :Rg<CR>
"map <M-c> :Rg<CR>
