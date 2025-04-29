-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",

  hl_override = {
    {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
    },
  },
  hl_add = require "configs.style",
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                                    ",
    "      ████ ██████           █████      ██                     ",
    "     ███████████             █████                             ",
    "     █████████ ███████████████████ ███   ███████████   ",
    "    █████████  ███    █████████████ █████ ██████████████   ",
    "   █████████ ██████████ █████████ █████ █████ ████ █████   ",
    " ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
    "██████  █████████████████████ ████ █████ █████ ████ ██████ ",
    "                            ",
    "     Themed By  NvChad    ",
    "                            ",
  },

  buttons = {
    { txt = "  New File", keys = "n", cmd = "enew" },
    { txt = "  Find File", no_gap = true, keys = "C-p", cmd = "FzfLua files" },
    { txt = "󰈭  Find Word", no_gap = true, keys = "C-f", cmd = "FzfLua live_grep" },
    { txt = "  Recent Files", keys = "C-i", cmd = "FzfLua oldfiles" },
    { txt = "  Git Files", no_gap = true, keys = "C-t", cmd = "FzfLua git_status" },
    {
      txt = "  LazyGit",
      keys = "A-i",
      cmd = ":lua require('toggleterm.terminal').Terminal :new({ cmd = 'lazygit', hidden = true, display_name = 'LazyGit' }) :toggle(10, 'float')",
    },
    { txt = "󱥚  Themes", keys = "t", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "󰒲  Lazy", keys = "l", cmd = ":Lazy" },
    { txt = "󰙅  Mason", keys = "m", cmd = ":Mason" },
    { txt = "󰑓  Reload Plugins", keys = "r", cmd = ":PluginsReload" },
    { txt = "  Mappings", keys = "?", cmd = "NvCheatsheet" },
    { txt = "  Quit", keys = "q", cmd = ":qa" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}
M.mason = {
  cmd = true,
  pkgs = {
    "black",
    "cspell",
    "delve",
    "gofumpt",
    "goimports",
    "google-java-format",
    "gopls",
    "gradle-language-server",
    "hadolint",
    "intelephense",
    "isort",
    "js-debug-adapter",
    "json-lsp",
    "jsonlint",
    "lua-language-server",
    "php-cs-fixer",
    "php-debug-adapter",
    "phpcs",
    "prettierd",
    "prisma-language-server",
    "pyright",
    "ruff",
    "rustywind",
    "shellcheck",
    "shfmt",
    "sqlfluff",
    "stylua",
    "tailwindcss-language-server",
    "taplo",
    "vale",
    "vtsls",
    "xmlformatter",
  },
}

M.lsp = {
  -- conflict with noice.nvim lsp
  signature = false,
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  cmp = {
    enabled = true,
    style = "atom",
  },
  statusline = {
    theme = "minimal",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "%=", "diagnostics", "lsp", "macro", "cwd", "cursor" },
    modules = {
      macro = function()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        end -- not recording
        return "Recording @" .. reg .. " "
      end,
      -- keystroke = function()
      --   vim.on_key(function()
      --     vim.cmd [[ doautoall ]]
      --   end)
      --   return " " .. (require("noice").api.status.command.get() or "") .. " "
      -- end,
    },
  },
}

return M
