-- Telescope
packer.use {
  'nvim-telescope/telescope.nvim',
  requires = {
    {"nvim-telescope/telescope-frecency.nvim"},
    {"tami5/sql.nvim"},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'}
  },
  config = function()
    local telescope_actions = require("telescope.actions")

    require('telescope').setup({
      extensions = {
        frecency = {
          show_scores = false,
          ignore_patterns = {"*.git/*", "*node_modules/*"},
        }
      },
      defaults = {
        color_devicons = true,
        layout_defaults = {
          flip_columns = 20,
          vertical = {
            width_padding = 0.1,
            preview_width = 0.1,
          },
          horizontal = {
            width_padding = 0.1,
            height_padding= 0.25
          }

        },
        layout_strategy = "flex",
        prompt_position = "top",
        sorting_strategy = "ascending",
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
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
    vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { silent = true})
    vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", {})
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

packer.use({"kdheepak/lazygit.vim", cmd = "LazyGit"})
vim.api.nvim_set_keymap("n", "<leader>g", ":LazyGit<CR>", {})

--map <M-c> :Rg<CR>
