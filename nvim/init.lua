vim.cmd [[ packadd packer.nvim ]]

if not packer then
  packer = require("packer")
  packer.init()
else
  packer.reset()
end

packer.use("wbthomason/packer.nvim")

-- load all the modules
for filename in io.popen("ls -1 " .. vim.loop.os_homedir() .. "/.dotfiles/nvim/lua"):lines() do
  local module = filename:match("(.+)%..+$")
  package.loaded[module] = nil
  require(module)
end
