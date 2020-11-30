vim.cmd [[packadd packer.nvim]]

if not packer then
  packer = require("packer")
  packer.init()
else
  packer.reset()
end

packer.use("wbthomason/packer.nvim")

function scandir(directory)
  local i, t = 0, {}
  for filename in io.popen("ls -1 " .. directory):lines() do
    if filename ~= "init.lua" then
      i = i + 1
      t[i] = filename:match("(.+)%..+$")
    end
  end
  return t
end

modules = scandir(vim.loop.os_homedir() .. "/.dotfiles/nvim/lua")

for _, m in ipairs(modules) do
  package.loaded[m] = nil
  require(m)
end
