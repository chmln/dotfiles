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
lsp.tsserver.setup { cmd = {"lsp-tsserver", "--stdio"}, on_attach = on_attach}
lsp.vimls.setup { on_attach = on_attach }
lsp.terraformls.setup{ on_attach = on_attach }
