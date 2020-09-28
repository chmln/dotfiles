function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

packer.use "mhartington/formatter.nvim"
vim.cmd [[packadd formatter.nvim]]

require("format").setup(
  {
    javascript = {prettier = prettier},
    typescript = {prettier = prettier},
    css = {prettier = prettier},
    json = {prettier = prettier},
    rust = {
      rustfmt = function()
        return {
          exe = "rustup",
          args = {"run", "nightly", "rustfmt"},
          stdin = true
        }
      end
    },
    lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
)

-- Code formatting
vim.api.nvim_command("augroup Fmt")
vim.api.nvim_command("au!")
vim.api.nvim_command("au! BufWritePre *.js,*.json,*.css,*.ts,*.tsx,*.rs,*.lua Format")
vim.api.nvim_command("augroup END")
