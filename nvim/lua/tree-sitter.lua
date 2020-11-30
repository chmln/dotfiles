packer.use "jvirtanen/vim-hcl"
packer.use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
vim.cmd [[packadd nvim-treesitter]]

require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true
  },
  refactor = {
    highlight_definitions = {enable = true}
  },
  incremental_selection = {
    -- this enables incremental selection
    enable = true,
    disable = {"cpp", "lua"},
    keymaps = {
      -- mappings for incremental selection (visual mappings)
      node_incremental = "gn", -- "grn" by default,
      scope_incremental = "<leader>f" -- "grc" by default
    }
  },
  node_movement = {
    -- this cursor movement in node hierachy
    enable = false,
    disable = {"cpp", "rust"},
    keymaps = {
      -- mappings for node movement (normal mappings)
      move_up = "<a-k>", -- default is to move with alt key hold
      move_down = "<a-j>",
      move_left = "<a-h>",
      move_right = "<a-l>"
    }
  },
  ensure_installed = "all"
}

require "nvim-treesitter.highlight"
local hlmap = vim.treesitter.highlighter.hl_map

--Misc
hlmap.error = nil
hlmap["punctuation.delimiter"] = "Delimiter"
hlmap["punctuation.bracket"] = "Delimiter"

-- Constants
hlmap["constant"] = "Constant"
hlmap["constant.builtin"] = "Type"
hlmap["constant.macro"] = "Define"
hlmap["string"] = "String"
hlmap["string.regex"] = "String"
hlmap["string.escape"] = "SpecialChar"
hlmap["character"] = "Character"
hlmap["number"] = "Number"
hlmap["boolean"] = "Boolean"
hlmap["float"] = "Float"

-- Functions
hlmap["function"] = "Function"
hlmap["function.builtin"] = "Special"
hlmap["function.macro"] = "Macro"
hlmap["parameter"] = "Identifier"
hlmap["method"] = "Function"
hlmap["field"] = "Identifier"
hlmap["property"] = "Identifier"
hlmap["constructor"] = "Type"

-- Keywords
hlmap["conditional"] = "Conditional"
hlmap["repeat"] = "Repeat"
hlmap["label"] = "Label"
hlmap["operator"] = "Operator"
hlmap["keyword"] = "Repeat"
hlmap["exception"] = "Exception"
hlmap["include"] = "Include"
hlmap["type"] = "Type"
hlmap["type.builtin"] = "Type"
hlmap["structure"] = "Structure"
