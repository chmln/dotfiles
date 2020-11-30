function prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

packer.use "mhartington/formatter.nvim"

require("formatter.config").set_defaults(
  {
    logging = false,
    filetype = {
      lua = {
        function()
          return {
            exe = "lua-fmt-ext",
            args = {"-l", "80", "-i", 2, "--stdin"},
            stdin = true
          }
        end
      },
      javascript = {prettier},
      typescript = {prettier},
      css = {prettier},
      json = {prettier},
      rust = {
        function()
          return {
            exe = "rustup",
            args = {"run", "nightly", "rustfmt"},
            stdin = true
          }
        end
      }
    }
  }
)

-- Code formatting
vim.api.nvim_command("augroup Format")
vim.api.nvim_command("au!")
vim.api.nvim_command(
  "au BufWrite *.js,*.json,*.css,*.ts,*.tsx,*.rs,*.lua Format"
)
vim.api.nvim_command("augroup END")
