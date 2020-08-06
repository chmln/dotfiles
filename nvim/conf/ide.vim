Plug 'neoclide/coc.nvim', {'do': 'npm i'}
Plug 'neoclide/coc-tsserver', {'do': 'npx yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'npx yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'npx yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'npm i'}

Plug 'nvim-treesitter/nvim-treesitter'

" lsp tags / classes / functions / etc
Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 1

set updatetime=300
set shortmess+=c

nmap <silent> <F10> <Plug>(coc-diagnostic-next)
nmap <silent> K :call CocActionAsync("doHover")<CR>
nmap <silent> <F12> <Plug>(coc-definition)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

augroup coc
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm i' }
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
let g:rustfmt_autosave_if_config_present = 1

augroup Fmt
  au!
  au! BufWritePre *.js,*.json,*.css,*.scss,*.less,*.ts,*.tsx PrettierAsync
augroup END

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
nnoremap <silent> <leader>f :CHADopen<CR>

Plug 'kdheepak/lazygit.vim', { 'on': 'LazyGit' }
nmap <leader>g :LazyGit<CR>

" Navigation
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

map <silent><C-p> :FZFFiles<CR>
map <M-c> :FZFRg<CR>
map <silent><C-f> :FZFRg<CR>
