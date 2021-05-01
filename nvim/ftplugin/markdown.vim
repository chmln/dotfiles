let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']
let g:markdown_syntax_conceal = 1

function! s:goyo_enter()
  setlocal spell
  setlocal lbr
  setlocal wrap
  nnoremap j gj
  vnoremap j gj
  nnoremap k gk
  vnoremap k gk
  nnoremap 0 g0
  vnoremap 0 g0
  nnoremap $ g$
  vnoremap $ g$
  setlocal nocursorline
  TZAtaraxis
endfunction

function! s:goyo_leave()
  TZAtaraxis
  nnoremap j j
  vnoremap j j
  nnoremap k k
  vnoremap k k
  nnoremap 0 0
  vnoremap 0 0
  nnoremap $ $
  vnoremap $ $
endfunction

augroup goyo_markdown
  au!
  au BufEnter *.md call s:goyo_enter()
  au BufLeave *.md call s:goyo_leave()
augroup END
