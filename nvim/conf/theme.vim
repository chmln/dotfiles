set background=light
let g:clap_theme = 'material_design_dark'

function! s:customize_colorscheme()
    if $IS_DAY
        call one#highlight('Normal', '', 'white', 'none')
        call one#highlight('CursorLineNR', '', 'white', 'none')
    else
        call one#highlight('Normal', '', 'black', 'none')
        call one#highlight('CursorLineNR', '', 'black', 'none')
    endif
endfunction

autocmd VimEnter * call s:customize_colorscheme()

