-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Change to directory given as argument
vim.cmd("if argc() == 1 && isdirectory(argv(0)) | cd `=argv(0)` | endif")

-- set up powershell
vim.cmd([[
  let &shell = executable('pwsh') ? 'pwsh' : 'powershell -NoLogo'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  set shellquote= shellxquote=
]])

-- Remove autocmd wrap and spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt.wrap = false
    vim.opt.spell = false
  end,
})

-- Enable Twilight
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd("TwilightEnable")
  end,
})

-- Quit buffer first then exit
local M = {}

local count_opened_bufs = function()
  local listBufs = vim.api.nvim_list_bufs()
  local count = 0
  for _, buffer in pairs(listBufs) do
    if
      vim.api.nvim_buf_is_loaded(buffer)
      and vim.api.nvim_buf_get_name(buffer) ~= nil
      and vim.api.nvim_buf_get_name(buffer) ~= ""
      and vim.api.nvim_buf_get_name(buffer) ~= " "
    then
      count = count + 1
    end
  end
  return count
end

function M.close_buffer()
  if count_opened_bufs() <= 1 then
    vim.api.nvim_exec2([[:q]], { output = true })
  else
    vim.api.nvim_exec2([[:bd]], { output = true })
  end
end

vim.api.nvim_create_user_command("QB", function()
  M.close_buffer()
end, { nargs = 0, desc = "Quit Buffer First Then Exit" })

vim.api.nvim_create_user_command("Notification", function()
  require("snacks").notifier.show_history(opts)
end, { nargs = 0, desc = "Show notifications history" })

vim.cmd([[
    cabbrev q QB
]])

-- disable inlay hints
vim.lsp.inlay_hint.enable(false)
