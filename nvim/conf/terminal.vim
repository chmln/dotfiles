Plug 'vimlab/split-term.vim'
set splitbelow
let g:disable_key_mappings = 1

" open terminal in a split
map <F5> :Term<CR>

" open external terminal
noremap <silent> <F4> :silent !nohup terminal >/dev/null 2>&1 &<CR>

" hide line numbers for fzf and other terminal uis
au TermOpen * setlocal nonumber norelativenumber

" allow esc to unfocus terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <F5> <C-\><C-n><CR>:q!<CR>

