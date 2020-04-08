" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" git integration
Plug 'tpope/vim-fugitive'
augroup fugitive_emptybuf
    au!
    au VimEnter * if &ft == '' | call FugitiveDetect(getcwd()) | endif
augroup END

" ======== FZF ============= "
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = v:false

map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>
