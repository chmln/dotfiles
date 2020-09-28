vim.cmd [[packadd packer.nvim]]

if not packer then
   packer = require("packer")
   packer.init()

   packer.use("wbthomason/packer.nvim")
end

require("base")
require("lsp_config")
require("tree-sitter")
require("formatter")
require("text")
require("appearance")
