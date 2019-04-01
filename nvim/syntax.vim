Plug 'joshdick/onedark.vim'

let g:onedark_color_overrides = {
\ "black": {"gui": "#000", "cterm": "0", "cterm16": "0" },
\}

syntax on
set termguicolors

" tag highlighter
Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'typescript.tsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\}

" typescript + tsx
Plug 'soywod/typescript.vim'

" rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_command = 'rustup run nightly rustfmt'

Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'chr4/nginx.vim'
Plug 'mboughaba/i3config.vim'
