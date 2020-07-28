require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,                 -- false will disable the whole extension
        disable = {},     -- list of language that will be disabled
    },
    incremental_selection = {             -- this enables incremental selection
        enable = false,
        disable = { 'cpp', 'lua' },
        keymaps = {                       -- mappings for incremental selection (visual mappings)
          node_incremental = "<leader>e", -- "grn" by default,
          scope_incremental = "<leader>f" -- "grc" by default
        }
    },
    node_movement = {                           -- this cursor movement in node hierachy
        enable = false,
        disable = { 'cpp', 'rust' },
        keymaps = {                       -- mappings for node movement (normal mappings)
          move_up = "<a-k>",              -- default is to move with alt key hold
          move_down = "<a-j>",
          move_left = "<a-h>",
          move_right = "<a-l>",
        }
    },
    ensure_installed = 'all'
}
