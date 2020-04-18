local lsp = require "nvim_lsp"
local completion = require "completion"
local diagnostic = require "diagnostic"

function attach()
    completion.on_attach()
    diagnostic.on_attach()
end

lsp.cssls.setup {}
lsp.html.setup {}
lsp.jsonls.setup {}
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
lsp.vimls.setup {}
