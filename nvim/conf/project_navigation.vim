" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" git integration
Plug 'tpope/vim-fugitive'
autocmd VimEnter * if &ft == '' | call FugitiveDetect(getcwd()) | endif

" ======== FZF ============= "
Plug 'liuchengxu/vim-clap'
let g:clap_theme = 'material_design_dark'
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = v:false
let g:clap_current_selection_sign = { 'text': "\uf62e", 'texthl': "WarningMsg", "linehl": "ClapCurrentSelection"}

map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>
