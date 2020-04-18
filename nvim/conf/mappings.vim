" disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap Q q
nmap <silent> q :pclose<CR>
noremap <silent> <C-s> :w!<CR>
nnoremap <Tab> <C-W><C-W>

" LSP
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

nnoremap <silent> <F12> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <F10> :NextDiagnostic<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Navigation/Find
map <silent><C-p> :Clap files --hidden<CR>
map <silent><C-f> :Clap grep<CR>

" File Tree
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
