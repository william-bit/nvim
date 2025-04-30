local map = vim.keymap.set
local del = vim.keymap.del

local M = {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true, display_name = "LazyGit" }

M.toggle = function()
  lazygit:toggle(10, "float")
end

M.setCloseMap = function()
  map("t", "q", function()
    lazygit:close()
  end, { desc = "Terminal hide" })
  map("t", "<c-c>", function()
    lazygit:close()
  end, { desc = "Terminal hide" })
end

M.delCloseMap = function()
  del("t", "q")
end

M.hide = function()
  M.setCloseMap()
  local message_box = false
  vim.on_key(function(_, key)
    if key and #key > 0 then
      local mode = vim.api.nvim_get_mode()
      if mode.mode == "t" then
        local typed = vim.fn.keytrans(key)
        if typed == "c" or typed == ":" then
          M.delCloseMap();
          message_box = true
        end
        if message_box then
          if typed == "<CR>" or typed == "<Esc>" then
            M.setCloseMap()
            message_box = false
          end
        end
      end
    end
  end)
end

return M
