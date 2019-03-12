" distraction-free markdown editing
Plug 'SidOfc/mkdx'
Plug 'junegunn/goyo.vim'

function WriteMode()
  setlocal spell
  setlocal lbr
  setlocal wrap
  Goyo 80
  nnoremap j gj
  vnoremap j gj
  nnoremap k gk
  vnoremap k gk
endfunction
