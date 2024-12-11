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
  -- add catppuccin
  {
    "catppuccin/nvim",
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
        black3 = palettes.surface0,
        black4 = palettes.surface1,
        black5 = palettes.surface2,
        white = palettes.text,
        white2 = palettes.surface2,
        blue = palettes.blue,
        bright_blue = palettes.sapphire,
        purple = palettes.mauve,
        green = palettes.green,
        red = palettes.red,
        yellow = palettes.yellow,
        bright_yellow = palettes.yellow,
        orange = palettes.peach,
        bright_orange = palettes.peach,
        bright_purple = palettes.lavender,
        aqua = palettes.sapphire,
        bright_aqua = palettes.sapphire,
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
          Style.CMP(colors),
          Style.TreeSitter(colors)
        ),
      }
    end,
  },
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      local palettes = require("gruvbox").palette
      local colors = {
        darker_black = palettes.dark0_hard,
        black = palettes.dark0,
        black2 = palettes.dark0_soft,
        black3 = palettes.dark1,
        black4 = palettes.dark2,
        black5 = palettes.dark3,
        white = palettes.light0_hard,
        white2 = palettes.light1,
        blue = palettes.neutral_blue,
        bright_blue = palettes.bright_blue,
        purple = palettes.faded_purple,
        green = palettes.bright_green,
        red = palettes.bright_red,
        yellow = palettes.neutral_yellow,
        bright_yellow = palettes.bright_yellow,
        orange = palettes.neutral_orange,
        bright_orange = palettes.bright_orange,
        bright_purple = palettes.bright_purple,
        aqua = palettes.neutral_aqua,
        bright_aqua = palettes.bright_aqua,
      }
      local telescope_style = Style.Telescope(false, colors)

      return {
        overrides = vim.tbl_deep_extend(
          "force",
          telescope_style.hlgroups,
          telescope_style.styles,
          Style.NvimTree(colors),
          Style.LSP(colors),
          Style.CMP(colors),
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
            black3 = palettes.dark3,
            black4 = palettes.dark5,
            black5 = palettes.bg_dark,
            white = palettes.fg,
            white2 = palettes.comment,
            blue = palettes.blue,
            bright_blue = palettes.blue0,
            bright_purple = palettes.magenta,
            purple = palettes.purple,
            green = palettes.green,
            red = palettes.red,
            yellow = palettes.orange,
            bright_yellow = palettes.yellow,
            orange = palettes.orange,
            bright_orange = palettes.yellow,
            aqua = palettes.cyan,
            bright_aqua = palettes.blue6,
          }
          local telescope_style = Style.Telescope(false, colors)
          local colors_table = vim.tbl_deep_extend(
            "force",
            telescope_style.hlgroups,
            telescope_style.styles,
            Style.NvimTree(colors),
            Style.LSP(colors),
            Style.CMP(colors),
            Style.TreeSitter(colors)
          )
          for group, color in pairs(colors_table) do
            hl[group] = color
          end
        end,
      }
    end,
  },
}
