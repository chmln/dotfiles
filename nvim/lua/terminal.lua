-- open external terminal
vim.api.nvim_set_keymap(
  "n",
  "<F4>",
  ":silent !nohup env -u NVIM_LISTEN_ADDRESS terminal >/dev/null 2>&1 &<CR>",
  {}
)

packer.use {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_height = 0.999
    vim.g.floaterm_autoclose = 2
    vim.g.floaterm_title = ""

    vim.api.nvim_set_keymap("n", "<leader>g", ":FloatermNew lazygit<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<F5>", ":FloatermNew<CR>", {silent = true})
  end
}
