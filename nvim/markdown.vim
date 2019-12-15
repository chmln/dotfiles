" distraction-free markdown editing
Plug 'SidOfc/mkdx'
Plug 'junegunn/goyo.vim'

let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript']
let g:markdown_syntax_conceal = 1

function! Auto_goyo()
  if &ft == 'markdown'
    Goyo
  elseif exists('#goyo')
    Goyo!
  endif
endfunction

function! s:goyo_enter()
  setlocal spell
	setlocal lbr
	setlocal wrap
	nnoremap j gj
	vnoremap j gj
	nnoremap k gk
	vnoremap k gk
endfunction

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

autocmd! User GoyoEnter call s:goyo_enter()
autocmd! User GoyoLeave call s:goyo_leave()

let s:quitting=0

function! s:auto_goyo()
 if &ft == 'markdown'
  Goyo 80
 else
  let buf = bufnr('%')
  Goyo!
  execute 'b '.buf
 endif
endfunction

function! s:quit_pre()

endfunction

augroup goyo_markdown
 autocmd!
 autocmd BufEnter * call s:auto_goyo()
 autocmd QuitPre *.md let s:quitting = 1
augroup END
