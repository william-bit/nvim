local M = {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true, display_name = "LazyGit" }

M.toggle = function()
  lazygit:toggle(10, "float")
end

return M
