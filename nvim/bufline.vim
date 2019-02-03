Plug 'schickling/vim-bufonly'
Plug 'mgee/lightline-bufferline'

" show buffer line
set showtabline=0

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':.:s?src/??:s?components/??:s?routes/??'

noremap <Leader>q :bd<CR>
noremap <Leader>l :bn<CR>
noremap <Leader>h :bp<CR>
