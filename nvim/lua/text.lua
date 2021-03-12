-- Multiple Cursors
packer.use("mg979/vim-visual-multi")
vim.g.VM_default_mappings = 1

-- <C-k>   Move current line/selections up
-- <C-j>   Move current line/selections down
packer.use("matze/vim-move")
vim.g.move_key_modifier = "C"

packer.use({
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = {"TelescopePrompt"},
      })
    end
})

packer.use {
    "phaazon/hop.nvim",
    config = function()
        require'hop'.setup { keys = 'asdfghjklwertyuixcvbnm'}
        vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_words()<cr>", {})
        vim.api.nvim_set_keymap('n', '<S-s>', "<cmd>lua require'hop'.hint_lines()<cr>", {})
        vim.api.nvim_set_keymap('v', 's', "<cmd>lua require'hop'.hint_words({ extend_visual = true })<cr>", {})
        vim.api.nvim_set_keymap('v', '<S-s>', "<cmd>lua require'hop'.hint_lines({ extend_visual = true })<cr>", {})
    end
}
