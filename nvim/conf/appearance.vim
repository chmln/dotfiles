set nohlsearch
set showtabline=0 noshowcmd noshowmode laststatus=0 noruler
set nofoldenable
set cursorline
set title
set signcolumn=yes

" Keep cursor vertically centered
augroup cursor_centered
  au BufEnter * let &scrolloff=winheight(win_getid())
augroup END

" color scheme
Plug 'sainnhe/edge'
set notermguicolors

if $IS_DAY == 'true'
    set background=light
else
    set background=dark
endif

let g:edge_transparent_background = 1
let g:edge_disable_italic_comment = 1
let g:edge_cursor = 'blue'

function! s:customize_colorscheme()
    hi link rustDerive SpecialComment
    hi link rustDeriveTrait SpecialComment

    if $IS_DAY == 'true'
        hi CursorLine ctermbg=252
        hi Visual ctermbg=white
    endif
endfunction

augroup custom_colors
    au!
    au VimEnter * call s:customize_colorscheme()
augroup END

Plug 'luochen1990/rainbow'
let g:rainbow_active = 0
let lightcolors =  ['lightblue', 'lightyellow', 'red', 'darkgreen', 'darkyellow', 'lightred', 'yellow', 'cyan', 'magenta', 'white']
let darkcolors = ['DarkBlue', 'Magenta', 'White', 'Red', 'DarkGray', 'DarkGreen', 'DarkYellow']
let g:rainbow_conf = { 'ctermfgs': (&background=="light"? darkcolors : lightcolors)}
