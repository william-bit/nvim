local map = vim.keymap.set
local del = vim.keymap.del
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

M.lazygit = Terminal:new { cmd = "lazygit", hidden = true, display_name = "LazyGit" }

M.toggle = function()
  M.lazygit:toggle(10, "float")
end

M.setCloseMap = function()
  map("t", "q", function()
    M.lazygit:close()
  end)
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
        if message_box == false then
          if typed == "c" or typed == ":" then
            M.delCloseMap()
            message_box = true
          end
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
