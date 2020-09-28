packer.use("mg979/vim-visual-multi")
-- Multiple Cursors
vim.g.VM_default_mappings = 1

packer.use("matze/vim-move")
-- <C-k>   Move current line/selections up
-- <C-j>   Move current line/selections down
vim.g.move_key_modifier = "C"
