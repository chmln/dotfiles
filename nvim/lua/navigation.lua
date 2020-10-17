-- file tree
packer.use "kyazdani42/nvim-web-devicons"
packer.use "kyazdani42/nvim-tree.lua"
vim.g.lua_tree_follow = 1
vim.g.lua_tree_git_hl = 1
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
vim.api.nvim_set_keymap("n", "<leader>f", ":LuaTreeToggle<CR>", {})

packer.use({"kdheepak/lazygit.vim", cmd = "LazyGit"})
vim.api.nvim_set_keymap("n", "<leader>g", ":LazyGit<CR>", {})

-- navigation
packer.use "junegunn/fzf.vim"
vim.g.fzf_layout = {window = {width = 0.9, height = 0.6}}
vim.g.fzf_preview_window = "right:40%"

vim.api.nvim_set_keymap("", "<C-p>", ":Files<CR>", {})
vim.api.nvim_set_keymap("", "<C-f>", ":Rg<CR>", {})
--map <M-c> :Rg<CR>
