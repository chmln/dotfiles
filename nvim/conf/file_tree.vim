Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" NERDTREE
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeBookmarksFile = "/tmp/nerdtree_bookmarks"
let g:NERDTreeMarkBookmarks = 0
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true

augroup nerdtree
    au!
    " Close if the only remaining window is a nerdtree
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    au BufReadPre,FileReadPre * :NERDTreeClose
augroup END

nnoremap <silent> <Leader>f :NERDTreeFind<CR>
