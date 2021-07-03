packer.use "jvirtanen/vim-hcl"
packer.use "dag/vim-fish"
packer.use "mboughaba/i3config.vim"

packer.use {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require'colorizer'.setup()
  end
}

-- packer.use {
--   "nvim-treesitter/nvim-treesitter",
--   run = ":TSUpdate",
--   config = function()
--     require "nvim-treesitter.configs".setup {
--       ensure_installed = "all",
--       ignore_install = { "jsdoc", "comment" },
--       highlight = {
--         enable = true
--       },
--       -- indent = {
--       --   enable = true
--       -- },
--     }
--
--     require "nvim-treesitter.highlight"
--     local hlmap = vim.treesitter.highlighter.hl_map
--
--     --Misc
--     hlmap.error = nil
--     hlmap["punctuation.delimiter"] = "Delimiter"
--     hlmap["punctuation.bracket"] = "Delimiter"
--     -- Constants
--     hlmap["constant"] = "Constant"
--     hlmap["constant.builtin"] = "Type"
--     hlmap["constant.macro"] = "Define"
--     hlmap["string"] = "String"
--     hlmap["string.regex"] = "String"
--     hlmap["string.escape"] = "SpecialChar"
--     hlmap["character"] = "Character"
--     hlmap["number"] = "Number"
--     hlmap["boolean"] = "Boolean"
--     hlmap["float"] = "Float"
--     -- Functions
--     hlmap["function"] = "Function"
--     hlmap["function.builtin"] = "Special"
--     hlmap["function.macro"] = "Macro"
--     hlmap["parameter"] = "Identifier"
--     hlmap["method"] = "Function"
--     hlmap["field"] = "Identifier"
--     hlmap["property"] = "Identifier"
--     hlmap["constructor"] = "Type"
--     -- Keywords
--     hlmap["conditional"] = "Conditional"
--     hlmap["repeat"] = "Repeat"
--     hlmap["label"] = "Label"
--     hlmap["operator"] = "Operator"
--     hlmap["keyword"] = "Repeat"
--     hlmap["exception"] = "Exception"
--     hlmap["include"] = "Include"
--     hlmap["type"] = "Type"
--     hlmap["type.builtin"] = "Type"
--     hlmap["structure"] = "Structure"
--
--     end
-- }
