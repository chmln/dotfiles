let g:fzf_layout = { 'down': '~40%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)

"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>,
"  \ fzf#vim#with_preview(),
"  \ <bang>0)

map <C-p> :Files<CR>
map <C-f> :Rg<CR>
