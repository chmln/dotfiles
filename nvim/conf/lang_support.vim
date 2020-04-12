" hide tilde signs. using lua to avoid space at the end getting trimmed
lua vim.api.nvim_command('set fcs=eob:\\ ')

syntax on

Plug 'sbdchd/neoformat'
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" markdown
Plug 'SidOfc/mkdx'
Plug 'junegunn/goyo.vim'

" rust
Plug 'rust-lang/rust.vim'

" typescript
Plug 'soywod/typescript.vim'

" misc
Plug 'iloginow/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'dag/vim-fish'
Plug 'cespare/vim-toml'
Plug 'mboughaba/i3config.vim'
Plug 'GutenYe/json5.vim'
