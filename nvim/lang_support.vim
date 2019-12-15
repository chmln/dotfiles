" color scheme
Plug 'joshdick/onedark.vim'

let g:onedark_hide_endofbuffer = 1
let g:onedark_color_overrides = {
\ "black": {"gui": "#000", "cterm": "0", "cterm16": "0" },
\}

" hide tilde signs. using lua to avoid space at the end getting trimmed
lua vim.api.nvim_command('set fcs=eob:\\ ')

syntax on
set termguicolors

" code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm i' }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier


Plug 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'typescript.tsx': 1,
\ 'html' : 1,
\ 'xhtml' : 1,
\ 'xml' : 1,
\}

" misc
Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'mboughaba/i3config.vim'
Plug 'GutenYe/json5.vim'

" rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_command = 'rustfmt +nightly'
let g:rustfmt_options = '--edition 2018'
let g:rustfmt_autosave_if_config_present = 1

" typescript
Plug 'soywod/typescript.vim'
