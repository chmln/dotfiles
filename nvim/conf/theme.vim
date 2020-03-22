" color scheme
Plug 'sainnhe/edge'

"let g:clap_theme = 'material_design_dark'

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
        hi Visual guibg=darkgray
    endif
endfunction

autocmd VimEnter * call s:customize_colorscheme()

