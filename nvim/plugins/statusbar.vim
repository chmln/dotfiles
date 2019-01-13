let g:lightline = {
  \ "colorscheme": "onedark",
   \ 'enable': {
  \ 'statusline': 1,
  \ 'tabline': 1
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

let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':.:s?src/??:s?components/??:s?routes/??'

function! LightlineGitBranch()
  return "\ue0a0 ".gitbranch#name()
endfunction

