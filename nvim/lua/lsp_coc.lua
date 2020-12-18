packer.use {"neoclide/coc.nvim", branch = "release"}
packer.use {"neoclide/coc-tsserver", run = "npm i && git reset --hard"}
packer.use {"neoclide/coc-json", run = "npm i && git reset --hard"}
packer.use {"clangd/coc-clangd", run = "npm i && git reset --hard"}
packer.use {
  "fannheyward/coc-rust-analyzer",
  run = "npm i && git reset --hard"
}

vim.api.nvim_command(
  "noremap <silent> <leader>p :call CocActionAsync('diagnosticNext')<CR>"
)
vim.api.nvim_command('noremap <silent> K :call CocActionAsync("doHover")<CR>')
vim.api.nvim_command(
  'noremap <silent> gd :call CocActionAsync("jumpDefinition")<CR>'
)
vim.api.nvim_command(
  'noremap <silent> <leader>ac  :call CocActionAsync("codeAction")<CR>'
)
vim.api.nvim_command("noremap <silent> <leader>qf  :CocFix<CR>")
vim.api.nvim_command(
  'noremap <silent> <leader>rn :call CocActionAsync("rename")<CR>'
)
