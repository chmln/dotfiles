" hide line numbers for fzf and other terminal uis
au TermOpen * setlocal nonumber norelativenumber

" allow esc to unfocus terminal
tnoremap <Esc> <C-\><C-n>
