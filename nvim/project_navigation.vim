" infer project working directory
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git/']
let g:rooter_silent_chdir = 1

" git integration
Plug 'tpope/vim-fugitive'

" ======== FZF ============= "
Plug 'usr/bin/fzf' | Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_OPTS .= ' --border --margin 0,0,0,0'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let width = float2nr(&columns * 0.6)
  let height = min([max([20, float2nr(&lines * 0.3)]), 20])
  let opts = { 'relative': 'editor',
      \ 'row': 1,
      \ 'col': (&columns - width) / 2,
      \ 'width': width,
      \ 'height': height }

  let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
endfunction

command! -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 2..'}),
  \ <bang>0)

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)

map <silent><C-p> :Files<CR>
map <silent><C-f> :Find<CR>

