packer.use({
    "neovim/nvim-lspconfig",
    config = function()
        local lsp = require("lspconfig")
        lsp.rust_analyzer.setup{}
        lsp.tsserver.setup{}
        lsp.terraformls.setup{}
        lsp.cssls.setup{}
    end
})

packer.use({
    "hrsh7th/nvim-compe",
    config = function()
        require'compe'.setup({
          source = {
              buffer = false,
              path = false,
              tags = false,
              spell = false,
              calc = false,
              nvim_lsp = true,
              nvim_lua = true,
              path = false,
              treesitter = false,
          }
        })
    end
})

packer.use {
  "folke/lsp-trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup { }
  end
}

packer.use({ 'folke/lsp-colors.nvim' })

vim.api.nvim_set_keymap(
  "n",
  "K",
  ":lua vim.lsp.buf.hover()<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "gd",
  ":lua vim.lsp.buf.definition()<CR>",
  {noremap = true, silent = true}
)
