" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" git integration
Plug 'tpope/vim-fugitive'
autocmd VimEnter * if &ft == '' | call FugitiveDetect(getcwd()) | endif

" ======== FZF ============= "
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
let g:clap_no_matches_msg = ''
let g:clap_disable_run_rooter = v:false
let g:clap_theme = {
\ 'display': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'search_text': { 'ctermbg': 'Black', 'ctermfg': 'White' },
\ 'bg0': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'input': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'spinner': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'current_selection': { 'ctermbg': 'Blue', 'ctermfg': 'Black'   },
\ 'current_selection_sign': { 'ctermbg': 'Blue', 'ctermfg': 'Black', 'text': '> '  },
\ 'preview': { 'ctermbg': 'Black'  }
\ }

map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>
