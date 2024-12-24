-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.set("n", "<c-k>", "<c-v>")
map.set("n", "<c-k>", "A_<Esc>r")
map.set("n", "<c-c>", "za")
map.set("n", "x", '"_x')
map.set("n", "X", '"_X')
map.set("n", "=", "<c-w>+")
map.set("n", "-", "<c-w>-")
map.set("n", "(", "<c-w><")
map.set("n", ")", "<c-w>>")
map.set("n", "<c-n>", "<c-v>")

-- map.set("n", "<A-b>", "<cmd>Neotree toggle <CR>")
map.set("n", "<A-b>", require("nvim-tree.api").tree.toggle)
map.set("n", "<A-n>", "<cmd>enew <CR>")
map.set("n", "<A-o>", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

map.set("n", "<A-i>", function()
  Snacks.lazygit()
end, { desc = "Lazygit (Root Dir)" })

map.set("n", "gl", "<Plug>ReplaceWithRegisterOperator")
map.set("n", "gll", "<Plug>ReplaceWithRegisterLine")

map.set("n", ",", function()
  vim.lsp.buf.hover()
end, { desc = "Show variable info" })
map.set("n", "?", function()
  vim.diagnostic.open_float()
end, { desc = "Show Error info" })
map.set("n", "gs", function()
  vim.lsp.buf.rename()
end, { desc = "Rename LSP" })

map.set({ "n", "v" }, "g.", vim.lsp.buf.code_action, { desc = "LSP code action" })

map.set("n", "<c-t>", "<cmd>Trouble diagnostics toggle focus=true<CR>")

map.set("n", "<c-o>", "<cmd>FzfLua buffers <CR>")
map.set("n", "<c-f>", "<cmd>FzfLua live_grep<CR>")
map.set("n", "<c-p>", "<cmd>FzfLua files<CR>")
map.set("n", "<leader>fh", "<cmd>FzfLua help_tags <CR>")

map.set(
  "n",
  "<c-l>",
  '<cmd>lua require("which-key").show("z=", {mode = "n", auto = true})<CR>',
  { desc = "Fix spell check" }
)

-- Map Ctrl-Backspace to delete the previous word in insert mode.
vim.cmd([[
  imap <C-BS> <C-W>
  imap <C-h> <C-W>
]])

vim.cmd([[
    tnoremap <c-w> <c-@>
    tnoremap <A-[> <C-\><C-n>
]])

-- Handle link
function HandleLineURL()
  local line = vim.fn.getline(".")
  local url = string.match(line, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    print("Not link found")
  end
end

function HandleCursorUrl()
  local keyword = vim.fn.expand("<cWORD>")
  local url = string.match(keyword, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    HandleLineURL()
  end
end

vim.cmd([[
  nnoremap <A-;> <cmd>lua HandleCursorUrl()<CR>
]])

-- Toggle term
vim.keymap.set({ "n", "t" }, "<C-j>", function()
  require("toggleterm").toggle()
end, { desc = "terminal toggleable vertical term" })

for i = 10, 1, -1 do
  vim.keymap.set({ "n", "t" }, "<A-" .. i .. ">", function()
    require("toggleterm").toggle(i, 10, "git_dir", "horizontal", "terminal" .. i)
  end, { desc = "terminal toggleable vertical term" })
end

vim.keymap.set("t", "<c-u>", "<Up>")
vim.keymap.set("t", "<c-d>", "<Down>")
