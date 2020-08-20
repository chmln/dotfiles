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

" icons
Plug 'ryanoasis/vim-devicons'

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
        hi CursorLine ctermbg=255
        hi Visual ctermbg=white
    endif
endfunction

augroup custom_colors
    au!
    au VimEnter * call s:customize_colorscheme()
augroup END
