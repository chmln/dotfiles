call plug#begin('~/.local/share/nvim/plugged')
Plug 'sainnhe/edge'
call plug#end()

let g:edge_transparent_background = 1
let g:edge_disable_italic_comment = 1
colorscheme edge

lua require('init')
