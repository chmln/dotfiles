vim.cmd [[packadd packer.nvim]]

if not packer then
  packer = require("packer")
  packer.init()
else
  packer.reset()
end

packer.use("wbthomason/packer.nvim")

modules = {
  "base",
  "lsp_config",
  "tree-sitter",
  "formatter",
  "text",
  "appearance"
}

for _, m in ipairs(modules) do
  package.loaded[m] = nil
  require(m)
end
