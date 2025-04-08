local map = vim.keymap.set


map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- nvchad

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "select nvchad themes" })

map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })
-------------------------------------- user mapping ------------------------------------------

map("n", "<c-k>", "<c-v>")
map("n", "<c-k>", "A_<Esc>r")
map("n", "<c-c>", "za")
map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "=", "<c-w>+")
map("n", "-", "<c-w>-")
map("n", "(", "<c-w><")
map("n", ")", "<c-w>>")
map("n", "<c-n>", "<c-v>")

map("n", "<A-n>", "<cmd>enew <CR>")

map("n", "<A-;>", "<cmd>lua HandleCursorUrl()<CR>", { desc = "Open Url in cursor line" })

map("t", "<c-u>", "<Up>")
map("t", "<c-d>", "<Down>")

-- Map Ctrl-Backspace to delete the previous word in insert mode.
vim.cmd [[
  imap <C-BS> <C-W>
  imap <C-h> <C-W>
  tnoremap <c-w> <c-@>
  tnoremap <A-[> <C-\><C-n>
]]

-- Handle link
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


