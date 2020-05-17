Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/diagnostic-nvim'
Plug 'haorenW1025/completion-nvim'

let g:diagnostic_insert_delay = 1
let g:diagnostic_show_sign = 0
set signcolumn=yes

let g:completion_trigger_character = ['.', '::']
let g:completion_timer_cycle = 350
let g:completion_max_items = 20

set completeopt=menuone,noinsert,noselect
set shortmess+=c

nnoremap <silent> <F12> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <F10> :NextDiagnosticCycle<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
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

augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html PrettierAsync
  autocmd BufWritePre *.rs RustFmt
augroup END

" Git
Plug 'tpope/vim-fugitive'
augroup fugitive_emptybuf
    au!
    au VimEnter * if &ft == '' | call FugitiveDetect(getcwd()) | endif
augroup END

" Navigation
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = v:false
map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>

" Multiple Cursors
Plug 'mg979/vim-visual-multi'
let g:VM_default_mappings = 1
let g:VM_mouse_mappings = 0
let g:VM_reselect_first_insert = 0
let g:VM_reselect_first_always = 0
let g:VM_case_setting = "smart"
let g:VM_pick_first_after_n_cursors = 0
let g:VM_dynamic_synmaxcol = 0
let g:VM_disable_syntax_in_imode = 1
let g:VM_exit_on_1_cursor_left = 1
let g:VM_manual_infoline = 1

" File Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeBookmarksFile = "/tmp/nerdtree_bookmarks"
let g:NERDTreeMarkBookmarks = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
nnoremap <silent> <Leader>f :NERDTreeFind<CR>

augroup nerdtree
    au!
    " Close if the only remaining window is a nerdtree
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    au BufReadPre,FileReadPre * :NERDTreeClose
augroup END

Plug 'vimlab/split-term.vim'
