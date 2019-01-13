" spell check markdown files
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

" Keep cursor vertically centered
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

if has("nvim")
  " hide line numbers for fzf and other terminal uis
  au TermOpen * setlocal nonumber norelativenumber
endif

autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

" Update buffer on external changes
au FocusGained,BufEnter * :silent! !
