Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

let g:lightline = {
  \ "colorscheme": "onedark",
   \ 'enable': {
  \ 'statusline': 1,
  \ 'tabline': 0
  \ },
  \ "active": {
      \ "left": [["mode"], [ "gitbranch"]],
      \ "right": [[],[],['cocstatus']]
    \ },
  \ "tabline": {
    \ "left": [["buffers"]],
    \ "right": [[]],
  \ },
  \ "tab": {
    \ 'active': [ 'filename'],
    \ 'inactive': [ 'filename']
  \ },
  \ "component_expand": {
    \ 'buffers': 'lightline#bufferline#buffers',
  \ },
  \ "component_function": {
    \ 'gitbranch': 'LightlineGitBranch',
    \ 'cocstatus': 'coc#status'
  \ },
  \ "component_type": {
    \ 'buffers': 'tabsel',
  \ },
\}


function! LightlineGitBranch()
  return "\ue0a0 ".gitbranch#name()
endfunction

