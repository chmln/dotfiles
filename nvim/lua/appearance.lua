vim.o.hlsearch = false
vim.o.showtabline = 0
vim.o.showcmd = false
vim.o.showmode = false
vim.o.laststatus = 0
vim.o.ruler = false
vim.o.foldenable = false
vim.o.title = true
vim.o.winblend = 7
vim.o.pumblend = 7

vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

packer.use("sainnhe/edge")
vim.g.edge_transparent_background = 1
vim.g.edge_disable_italic_comment = 1
vim.cmd [[ colorscheme edge ]]

-- Keep cursor vertically centered
vim.api.nvim_command("augroup cursor_centered")
vim.api.nvim_command("au BufEnter * let &scrolloff=winheight(win_getid())")
vim.api.nvim_command("augroup END")

-- icons
packer.use "ryanoasis/vim-devicons"

if
  os.execute("sh -c 'systemctl --user show-environment | rg -q IS_DAY=true'") ==
    0
 then
  vim.o.background = "light"
else
  vim.o.background = "dark"
end

packer.use "Xuyuanp/scrollbar.nvim"
vim.g.scrollbar_excluded_filetypes = {"LuaTree"}
vim.g.scrollbar_max_size = 15
vim.g.scrollbar_min_size = 5
vim.g.scrollbar_right_offset = 0
vim.g.scrollbar_highlight = {
  head = "Comment",
  body = "Comment",
  tail = "Comment"
}
vim.g.scrollbar_shape = {head = "", body = "┃", tail = ""}

vim.api.nvim_command("augroup ScrollbarInit")
vim.api.nvim_command("au!")
vim.api.nvim_command(
  "au WinEnter,FocusGained,CursorMoved,VimResized * silent! lua require('scrollbar').show()"
)
vim.api.nvim_command(
  "au WinLeave,BufLeave,FocusLost * silent! lua require('scrollbar').clear()"
)
vim.api.nvim_command("augroup end")

vim.api.nvim_command("augroup CustomHighlights")
vim.api.nvim_command("au!")
vim.api.nvim_command("au BufEnter *.rs hi CocRustChainingHint guifg=#aaaaaa")
vim.api.nvim_command(
  "au BufEnter * if &background=='dark' | hi CursorLine guibg=#333333 | else | hi CursorLine guibg=#dddddd | endif"
)
vim.api.nvim_command("augroup end")

-- distraction-free markdown editing
packer.use "SidOfc/mkdx"
packer.use "junegunn/goyo.vim"
