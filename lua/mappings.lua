local map = vim.keymap.set
-------------------------------------- user mapping ------------------------------------------

-- highlights off
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- save and copy file
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<c-u>", "<Up>", { desc = "terminal scroll up" })
map("t", "<c-d>", "<Down>", { desc = "terminal scroll down" })

-- remap ctrl-n to ctrl-v
map("n", "<c-n>", "<c-v>")

-- fold shortcuts
map("n", "<c-c>", "za")

-- make x and X don't polute clipboard
map("n", "x", '"_x')
map("n", "X", '"_X')

-- editor windows shortcuts
map("n", "=", "<c-w>+")
map("n", "-", "<c-w>-")
map("n", "(", "<c-w><")
map("n", ")", "<c-w>>")

map("n", "<A-n>", "<cmd>enew <CR>")

-- Map Ctrl-Backspace to delete the previous word in insert mode.
vim.cmd [[
  imap <C-BS> <C-W>
  imap <C-h> <C-W>
  tnoremap <c-w> <c-@>
  tnoremap <A-[> <C-\><C-n>
]]

-- Handle link

map("n", "<A-;>", "<cmd>lua HandleCursorUrl()<CR>", { desc = "Open Url in cursor line" })

function HandleLineURL()
  local line = vim.fn.getline "."
  local url = string.match(line, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    print "Not link found"
  end
end

function HandleCursorUrl()
  local keyword = vim.fn.expand "<cWORD>"
  local url = string.match(keyword, "[a-z]*://[^ >,;]*")
  if url then
    os.execute("start " .. url)
  else
    HandleLineURL()
  end
end
