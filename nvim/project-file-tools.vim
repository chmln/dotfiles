" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.gitignore', 'package.json', 'pom.xml', 'Cargo.toml', '.git/']

" FZF
Plug 'usr/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '~40%' }

command! -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 2..'}),
  \ <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \ fzf#vim#with_preview(),
  \ <bang>0)

" vim-picker
"Plug 'srstevenson/vim-picker'
"let g:picker_selector_executable = 'sk'
"let g:picker_selector_flags='--reverse --no-height'

" find & replace
Plug 'brooth/far.vim'

map <C-p> :Files<CR>
map <C-f> :Find<CR>
