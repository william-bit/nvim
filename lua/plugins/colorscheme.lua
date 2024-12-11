local Style = require("config.style")

local colorscheme = Style.colorscheme

return {
  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = function()
      local function proses_colorscheme()
        local catppuccin = {
          "catppuccin_latte",
          "catppuccin_mocha",
          "catppuccin_macchiato",
          "catppuccin_frappe",
        }
        if vim.tbl_contains(catppuccin, colorscheme) then
          return "catppuccin"
        else
          return colorscheme
        end
      end
      return {
        colorscheme = proses_colorscheme(),
      }
    end,
  },
  require("plugins.theme.gruvbox"),
  require("plugins.theme.catppuccin"),
  require("plugins.theme.tokyonight"),
}
