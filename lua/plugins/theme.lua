local Style = require("config.colorscheme")

---@type "catppuccin_latte" | "catppuccin_mocha" | "catppuccin_macchiato" | "catppuccin_frappe" | "gruvbox" | 'tokyonight-night' | 'tokyonight-storm' | 'tokyonight-day' | 'tokyonight-moon'
local colorscheme = "tokyonight-day"

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
  -- setting catppuccin
  {
    "catppuccin/nvim",
    enabled = "catppuccin" == proses_colorscheme(),
    opts = function()
      local palettes = {}
      local flavour = "macchiato"
      if colorscheme == "catppuccin_latte" then
        palettes = require("catppuccin.palettes.latte")
        flavour = "latte"
      elseif colorscheme == "catppuccin_mocha" then
        palettes = require("catppuccin.palettes.mocha")
        flavour = "mocha"
      elseif colorscheme == "catppuccin_macchiato" then
        palettes = require("catppuccin.palettes.macchiato")
        flavour = "macchiato"
      else
        palettes = require("catppuccin.palettes.frappe")
        flavour = "frappe"
      end
      local colors = {
        darker_black = palettes.crust,
        black = palettes.base,
        black2 = palettes.mantle,
        one_bg = palettes.surface0,
        one_bg2 = palettes.surface1,
        one_bg3 = palettes.surface2,
        white = palettes.text,
        white2 = palettes.surface2,
        blue = palettes.blue,
        bright_blue = palettes.sapphire,
        purple = palettes.mauve,
        green = palettes.green,
        red = palettes.red,
        yellow = palettes.yellow,
        bright_yellow = palettes.bright_yellow,
      }
      local telescope_style = Style.Telescope(false, colors)

      return {
        flavour = flavour, -- latte, frappe, macchiato, mocha
        custom_highlights = vim.tbl_deep_extend(
          "force",
          telescope_style.hlgroups,
          telescope_style.styles,
          Style.NvimTree(colors),
          Style.LSP(colors),
          Style.TreeSitter(colors)
        ),
      }
    end,
  },
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = colorscheme == "gruvbox",
    opts = function()
      local palettes = require("gruvbox").palette
      local colors = {
        darker_black = palettes.dark0_hard,
        black = palettes.dark0,
        black2 = palettes.dark0_soft,
        one_bg = palettes.dark1,
        one_bg2 = palettes.dark2,
        one_bg3 = palettes.dark3,
        white = palettes.light1,
        white2 = palettes.light2,
        blue = palettes.neutral_blue,
        bright_blue = palettes.bright_blue,
        purple = palettes.bright_purple,
        green = palettes.bright_green,
        red = palettes.bright_red,
        yellow = palettes.neutral_yellow,
        bright_yellow = palettes.neutral_yellow,
      }
      local telescope_style = Style.Telescope(false, colors)

      return {
        overrides = vim.tbl_deep_extend(
          "force",
          telescope_style.hlgroups,
          telescope_style.styles,
          Style.NvimTree(colors),
          Style.LSP(colors),
          Style.TreeSitter(colors)
        ),
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = function()
      return {
        on_highlights = function(hl, palettes)
          local colors = {
            darker_black = palettes.bg_dark,
            black = palettes.bg,
            black2 = palettes.bg_highlight,
            one_bg = palettes.dark3,
            one_bg2 = palettes.dark5,
            one_bg3 = palettes.bg_dark,
            white = palettes.fg,
            white2 = palettes.comment,
            blue = palettes.blue,
            bright_blue = palettes.blue0,
            purple = palettes.purple,
            green = palettes.green,
            red = palettes.red,
            yellow = palettes.orange,
            bright_yellow = palettes.yellow,
          }
          local telescope_style = Style.Telescope(false, colors)
          local colors_table = vim.tbl_deep_extend(
            "force",
            telescope_style.hlgroups,
            telescope_style.styles,
            Style.NvimTree(colors),
            Style.LSP(colors),
            Style.TreeSitter(colors)
          )
          for group, colors in pairs(colors_table) do
            hl[group] = colors
          end
        end,
      }
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = proses_colorscheme(),
    },
  },
}
