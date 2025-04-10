-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath("data") .. "\\base46_cache\\"

require("configs.lazy")

-- put this after lazy setup

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("autocmds")
require("commands")

vim.schedule(function()
  require("mappings")
end)

