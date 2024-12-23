-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable vim inbuilt spell and wrap
vim.opt.wrap = false
vim.opt.spell = false
vim.opt.completeopt = ""
-- vim.opt.listchars = "eol:↲"

-- Remove h and l from 'whichwrap'
vim.cmd([[ 
  set whichwrap=h,l 
  set mousemoveevent
]])

-- Vscode snippets
vim.g.vscode_snippets_path = {
  "~/AppData/Local/nvim/snippet/phpstorm-snippets-for-vscode",
}
