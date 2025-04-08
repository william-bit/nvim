local keystroke = {}

keystroke.array_key = { "", "" }
local endCommand = {
  "h",
  "j",
  "k",
  "l",
  "H",
  "M",
  "L",
  "e",
  "q",
  "E",
  "w",
  "W",
  "b",
  "B",
  "%",
  "n",
  "^",
  "*",
  "_",
  "+",
  "=",
  ":",
  "_",
  "-",
  ";",
  ",",
  "G",
  "gg",
  "gd",
  "gD",
  "dd",
  "yy",
  "aw",
  "iw",
  "aW",
  "iW",
  "as",
  "is",
  "ap",
  "ip",
  "a]",
  "a[",
  "i]",
  "i[",
  "a)",
  "a(",
  "ab",
  "i)",
  "i(",
  "ib",
  "a>",
  "a<",
  "i>",
  "i<",
  "at",
  "it",
  "a}",
  "a{",
  "aB",
  "i}",
  "i{",
  "iB",
  'a"',
  "a'",
  "a`",
  'i"',
  "i'",
  "i`",
}

local function contains(list, x)
  for _, v in ipairs(list) do
    if v == x then
      return true
    end
  end
  return false
end
vim.on_key(function(_, key)
  if key and #key > 0 then
    local mode = vim.api.nvim_get_mode()
    if mode.mode == "n" or mode.mode == "no" then
      local input_key = table.concat(keystroke.array_key)
      local typed = vim.fn.keytrans(key)
      local last_typed = keystroke.array_key[#keystroke.array_key]
      local last_2typed = keystroke.array_key[#keystroke.array_key - 1] .. keystroke.array_key[#keystroke.array_key]
      if
        input_key == "0"
        or input_key == "$"
        or string.match(typed, "<.+>")
        or string.match(last_typed, "<.+>")
        or string.match(last_2typed, "[f|F|t|T].")
        or string.match(last_2typed, "[a-zA-Z][0|$]")
        or contains(endCommand, last_typed)
        or contains(endCommand, last_2typed)
      then
        keystroke.array_key = { "", "" }
      end
      table.insert(keystroke.array_key, typed)
    end
    vim.cmd [[ doautoall ]]
  end
end)

return keystroke
