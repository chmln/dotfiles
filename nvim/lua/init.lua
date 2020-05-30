function setup_lsp()
    local lsp = require "nvim_lsp"
    local completion = require "completion"
    local diagnostic = require "diagnostic"

    function on_attach()
        diagnostic.on_attach()
        completion.on_attach()
    end

    lsp.cssls.setup { cmd= {"css-languageserver", "--node-ipc" }, on_attach = on_attach }
    lsp.html.setup { cmd= {"html-languageserver", "--node-ipc" }, on_attach = on_attach }
    lsp.jsonls.setup { cmd= {"json-languageserver", "--node-ipc"},  on_attach = on_attach }

    lsp.pyls.setup{ on_attach = on_attach }

    lsp.rust_analyzer.setup {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                completion = {
                    addCallArgumentSnippets = false,
                    addCallParenthesis = false,
                    postfix = {enable = false}
                }
            }
        }
    }
    lsp.tsserver.setup {on_attach = on_attach}
    lsp.vimls.setup { on_attach = on_attach }
end

setup_lsp()
--require'nvim-treesitter.configs'.setup {
--    highlight = {
--        enable = true,                 -- false will disable the whole extension
--        disable = {},     -- list of language that will be disabled
--    },
--    incremental_selection = {             -- this enables incremental selection
--        enable = false,
--        disable = { 'cpp', 'lua' },
--        keymaps = {                       -- mappings for incremental selection (visual mappings)
--          node_incremental = "<leader>e", -- "grn" by default,
--          scope_incremental = "<leader>f" -- "grc" by default
--        }
--    },
--    node_movement = {                           -- this cursor movement in node hierachy
--        enable = false,
--        disable = { 'cpp', 'rust' },
--        keymaps = {                       -- mappings for node movement (normal mappings)
--          move_up = "<a-k>",              -- default is to move with alt key hold
--          move_down = "<a-j>",
--          move_left = "<a-h>",
--          move_right = "<a-l>",
--        }
--    },
--    ensure_installed = 'all'
--}
