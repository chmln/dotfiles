call plug#begin('~/.local/share/nvim/plugged')
Plug 'sainnhe/edge'
call plug#end()

let g:edge_transparent_background = 1
let g:edge_disable_italic_comment = 1
colorscheme edge
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

lua package.loaded.init = nil; require('init')
