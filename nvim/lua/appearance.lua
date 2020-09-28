vim.o.hlsearch = false
vim.o.showtabline = 0
vim.o.showcmd = false
vim.o.showmode = false
vim.o.laststatus = 0
vim.o.ruler = false
vim.o.foldenable = false
vim.o.cursorline = true
vim.o.title = true
vim.o.signcolumn = "yes"
vim.o.winblend = 5
vim.o.pumblend = 5

-- Keep cursor vertically centered
vim.api.nvim_command("augroup cursor_centered")
vim.api.nvim_command("au BufEnter * let &scrolloff=winheight(win_getid())")
vim.api.nvim_command("augroup END")

-- icons
packer.use "ryanoasis/vim-devicons"

if os.getenv("IS_DAY") == "true" then
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
vim.g.scrollbar_shape = {
  head = "",
  body = "┃",
  tail = ""
}

vim.api.nvim_command("augroup ScrollbarInit")
vim.api.nvim_command("au!")
vim.api.nvim_command("au WinEnter,FocusGained,CursorMoved,VimResized * silent! lua require('scrollbar').show()")
vim.api.nvim_command("au WinLeave,FocusLost * silent! lua require('scrollbar').clear()")
vim.api.nvim_command("augroup end")

-- distraction-free markdown editing
packer.use "SidOfc/mkdx"
packer.use "junegunn/goyo.vim"
