Plug 'neovim/nvim-lsp'

Plug 'haorenW1025/diagnostic-nvim'
let g:diagnostic_insert_delay = 1
set signcolumn=yes
call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})

Plug 'haorenW1025/completion-nvim'
"let g:completion_trigger_character = ['.', '::']
let g:completion_timer_cycle = 350
let g:completion_max_items = 10
let g:completion_enable_fuzzy_match = 1
"let g:completion_trigger_on_delete = 1
let g:completion_matching_ignore_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set completeopt=menuone,noinsert,noselect

set updatetime=300
set shortmess+=c

nnoremap <silent> <F12> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <F10> :NextDiagnosticCycle<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! RestartLsp()
  lua vim.lsp.stop_client(vim.lsp.get_active_clients())
  lua vim.lsp.stop_client(vim.lsp.get_active_clients())
  sleep 100m
  edit
endfunction

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

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
let g:lua_tree_follow = 1
nnoremap <silent> <leader>f :LuaTreeToggle<CR>
" ---------------
" Plug 'scrooloose/nerdtree'
" let g:NERDTreeShowHidden = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeIgnore = []
" let g:NERDTreeStatusline = ''
" nnoremap <silent> <leader>f :NERDTreeToggle<CR>
" " nerdtree: follow file
" Plug 'unkiwii/vim-nerdtree-sync'
" let g:nerdtree_sync_cursorline = 1

Plug 'kdheepak/lazygit.vim', { 'on': 'LazyGit' }

" Navigation
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

map <silent><C-p> :FZFFiles<CR>
map <M-c> :FZFRg<CR>
map <silent><C-f> :FZFRg<CR>
