-- file tree
packer.use "kyazdani42/nvim-web-devicons"
require "nvim-web-devicons".setup {
  default = true
}

packer.use "kyazdani42/nvim-tree.lua"
vim.g.lua_tree_follow = 1
vim.g.lua_tree_git_hl = 0
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },
  folder = {
    default = "",
    open = ""
  }
}

vim.g.lua_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeToggle<CR>", {})
vim.api.nvim_command("augroup luatree")
vim.api.nvim_command("au!")
vim.api.nvim_command(
  "au CursorHold,CursorHoldI * silent! NvimTreeRefresh"
)
vim.api.nvim_command("augroup END")


packer.use({"kdheepak/lazygit.vim", cmd = "LazyGit"})
vim.api.nvim_set_keymap("n", "<leader>g", ":LazyGit<CR>", {})

-- navigation
packer.use "junegunn/fzf"
packer.use "junegunn/fzf.vim"
vim.g.fzf_layout = {window = {width = 0.9, height = 0.6}}
vim.g.fzf_preview_window = "right:40%"

vim.api.nvim_set_keymap("", "<C-p>", ":Files<CR>", {})
vim.api.nvim_set_keymap("", "<C-f>", ":Rg<CR>", {})
--map <M-c> :Rg<CR>
