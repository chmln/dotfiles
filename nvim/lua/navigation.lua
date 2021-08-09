-- Telescope
packer.use {
  'nvim-telescope/telescope.nvim',
  requires = {
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'}
  },
  config = function()
    local telescope_actions = require("telescope.actions")

    require('telescope').setup({
      defaults = {
        color_devicons = true,
        layout_config = {
          prompt_position = "top",
        },
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        mappings = {
          i = {
             ["<c-j>"] = telescope_actions.move_selection_next,
             ["<c-k>"] = telescope_actions.move_selection_previous,
             ["<esc>"] = telescope_actions.close,
          },
          n = {
            ["q"] = telescope_actions.close
          },
        }
      }
    })
    vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", { silent = true})
    vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", { silent = true })
  end
}

-- file tree
packer.use {
  "kyazdani42/nvim-tree.lua",
  config = function()
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_git_hl = 0
    vim.g.nvim_tree_auto_close = 1
    vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
      },
      folder = {
        default = "",
        open = ""
      }
    }

    vim.g.nvim_tree_show_icons = {
      git = 0,
      folders = 1,
      files = 1
    }
    vim.api.nvim_set_keymap("n", "<leader>f", ":NvimTreeToggle<CR>", {})
  end
}

--map <M-c> :Rg<CR>
