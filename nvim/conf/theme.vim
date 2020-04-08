" color scheme
Plug 'sainnhe/edge'
Plug 'fxn/vim-monochrome'
set notermguicolors

if $IS_DAY == 'true'
    set background=light
else
    set background=dark
endif

let g:clap_theme = {
\ 'display': { 'ctermbg': 'Black', 'ctermfg': 'White'},
\ 'file': { 'ctermbg': 'Black', 'ctermfg': '1', 'guifg': 'black'},
\ 'search_text': { 'ctermbg': 'Black', 'ctermfg': 'White' },
\ 'bg0': { 'ctermbg': 'White', 'ctermfg': 'Black', 'cterm': 'Bold'  },
\ 'input': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'spinner': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ 'current_selection': { 'ctermbg': 'White', 'ctermfg': 'Black'   },
\ 'current_selection_sign': { 'ctermbg': 'White', 'ctermfg': 'Black', 'text': '> '  },
\ 'preview': { 'ctermbg': 'Black', 'ctermfg': 'White'  },
\ }

let g:clap_fuzzy_match_hl_groups  = [
\ ['8', '#87ff00'] ,
\ ['8', '#5fff00'] ,
\ ['8', '#00ff00'] ,
\ ['8', '#00ff5f'] ,
\ ['8', '#00ff87'] ,
\ ['8', '#00ffaf'] ,
\ ['8', '#00ffd7'] ,
\ ['8', '#00ffff'] ,
\ ['8', '#5fffff'] ,
\ ['8', '#87ffff'] ,
\ ['8', '#afffff'] ,
\ ['8', '#d7ffff'] ,
\ ]

let g:edge_transparent_background = 1
let g:edge_disable_italic_comment = 1
let g:edge_cursor = 'blue'

function! s:customize_colorscheme()
    hi link rustDerive SpecialComment
    hi link rustDeriveTrait SpecialComment
    hi link ClapFile ClapDisplay

    if $IS_DAY == 'true'
        hi CursorLine ctermbg=252
        hi Visual ctermbg=white
    endif
endfunction

augroup custom_colors
    au!
    au VimEnter * call s:customize_colorscheme()
augroup END

