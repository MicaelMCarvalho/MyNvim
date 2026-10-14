-- Ensure Node.js installed through NVM is available to Neovim
local node_bin = vim.fn.expand("~/.nvm/versions/node/v22.20.0/bin")

if vim.fn.isdirectory(node_bin) == 1 then
  vim.env.PATH = node_bin .. ":" .. vim.env.PATH
end

require("config.lazy")
