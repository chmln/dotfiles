-- Multiple Cursors
packer.use("mg979/vim-visual-multi")
vim.g.VM_default_mappings = 1

-- <C-k>   Move current line/selections up
-- <C-j>   Move current line/selections down
packer.use("matze/vim-move")
vim.g.move_key_modifier = "C"
