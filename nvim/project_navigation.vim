" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" git integration
Plug 'tpope/vim-fugitive'
autocmd VimEnter * if &ft == '' | call FugitiveDetect(getcwd()) | endif

" ======== FZF ============= "
Plug 'liuchengxu/vim-clap', { 'branch': 'add-substr-scorer' }
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = 1

map <silent><C-p> :Clap files<CR>
map <silent><C-f> :Clap grep<CR>
