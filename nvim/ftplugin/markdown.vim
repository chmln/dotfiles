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
  setlocal nocursorline
endfunction

let s:quitting=0
function! s:goyo_leave()
	nnoremap j j
	vnoremap j j
	nnoremap k k
	vnoremap k k
  " Quit Vim if this is the only remaining buffer
  if s:quitting
    qa!
  endif
endfunction


function! s:auto_goyo()
 if &ft == 'markdown'
  Goyo 80
 else
  let buf = bufnr('%')
  Goyo!
  execute 'b '.buf
 endif
endfunction

augroup goyo_markdown
  au!
  au User GoyoEnter call s:goyo_enter()
  au User GoyoLeave call s:goyo_leave()
  au BufEnter * call s:auto_goyo()
  au QuitPre *.md let s:quitting = 1
augroup END
