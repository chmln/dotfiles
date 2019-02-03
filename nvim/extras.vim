Plug 'lambdalisue/gina.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm i' }

" distraction-free markdown editing
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

