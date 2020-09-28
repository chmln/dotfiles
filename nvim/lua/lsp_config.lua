packer.use 'nvim-lua/diagnostic-nvim'
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_virtual_text_prefix = ' '
vim.g.diagnostic_enable_underline = 1
vim.g.diagnostic_insert_delay = 1

vim.api.nvim_command('call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})')
vim.api.nvim_command('call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})')
vim.api.nvim_command('call sign_define("LspDiagnosticInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})')

packer.use 'norcalli/snippets.nvim'
vim.cmd [[packadd snippets.nvim]]
require("snippets").use_suggested_mappings()
packer.use 'nvim-lua/completion-nvim'
vim.g.completion_timer_cycle = 200
vim.g.completion_matching_strategy_list = {'exact'}
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_sorting = 'none'
vim.o.completeopt="menuone,noinsert,noselect"
vim.o.updatetime=300

-- LSP Extensions (inlay-hints)
packer.use 'tjdevries/lsp_extensions.nvim'

packer.use("neovim/nvim-lsp")
vim.cmd [[packadd nvim-lsp]]

local lsp_config = {
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        completion = {
          addCallArgumentSnippets = false,
          addCallParenthesis = false,
          postfix = {enable = false}
        }
      }
    }
  },
  tsserver = {cmd = {"lsp-tsserver", "--stdio"}},
  jsonls = {cmd = {"json-languageserver", "--node-ipc"}},
  cssls = {cmd = {"css-languageserver", "--node-ipc"}},
  html = {cmd = {"html-languageserver", "--node-ipc"}},
  yamlls = {cmd = {"yaml-language-server"}},
  clangd = {},
  vimls = {},
  terraformls = {},
  sumneko_lua = {
    cmd = {"lua-language-server"},
    filetypes = {"lua"},
    settings = {
      Lua = {
        runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
        completion = { keywordSnippet = "Disable" },
        diagnostics = { enable = true, globals = { "vim", } },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/treesitter")] = true,
            ["/home/greg/.cache/yay/neovim/src/nvim/lua"] = true
          },
        }
      }
    }
  }
}

for name, config in pairs(lsp_config) do
  (require "nvim_lsp")[name].setup( {
      on_attach = function()
        require "completion".on_attach()
        require "diagnostic".on_attach()
      end,
      cmd = config.cmd or nil,
      settings = config.settings or nil,
      filetypes = config.filetypes or nil,
    })
end

function RestartLsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.api.nvim_command("edit")
end

vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>NextDiagnosticCycle<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })

vim.api.nvim_set_keymap("", "<expr> <Tab>", '  pumvisible() ? "<C-n>" : "<Tab>"', {})
vim.api.nvim_set_keymap("", "<expr> <S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {})


-- lsp tags / classes / functions / etc
packer.use 'liuchengxu/vista.vim'
vim.g.vista = { renderer = { enable_icon = 1 } }
vim.g.vista_ignore_kinds = {'Property', 'Field', 'EnumMember'}



packer.use 'kyazdani42/nvim-web-devicons'
packer.use 'kyazdani42/nvim-tree.lua'
vim.g.lua_tree_follow = 1
vim.g.lua_tree_git_hl = 1
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_show_icons = {
    git= 1,
    folders= 1,
    files= 1,
  }
vim.api.nvim_set_keymap("n", "<leader>f", ":LuaTreeToggle<CR>", {})

packer.use({'kdheepak/lazygit.vim', branch = 'nvim-v0.4.3', cmd = 'LazyGit' })
vim.api.nvim_set_keymap("n", "<leader>g", ":LazyGit<CR>", {})

-- Navigation
packer.use 'junegunn/fzf.vim'
vim.g.fzf_layout = { window= { width= 0.9, height= 0.6 } }
vim.g.fzf_preview_window = 'right:40%'

vim.api.nvim_set_keymap("", "<C-p>", ":Files<CR>", {})
vim.api.nvim_set_keymap("", "<C-f>", ":Rg<CR>", {})
--map <M-c> :Rg<CR>
