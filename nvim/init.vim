call plug#begin('~/.local/share/nvim/plugged')
runtime! conf/*.vim
call plug#end()

colorscheme edge

"lua << EOF
"require'nvim_lsp'.rust_analyzer.setup{}
"require'nvim_lsp'.tsserver.setup{}
"EOF

