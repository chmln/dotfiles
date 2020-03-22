"hi link	rustAwait Conditional
"hi link rustDerive SpecialComment
"hi link rustAttribute SpecialComment
"hi link rustStructure Structure

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
