local Style = require("config.style")

return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = function()
    local palettes = {}
    local flavour = "macchiato"
    if Style.colorscheme == "catppuccin_latte" then
      palettes = require("catppuccin.palettes.latte")
      flavour = "latte"
    elseif Style.colorscheme == "catppuccin_mocha" then
      palettes = require("catppuccin.palettes.mocha")
      flavour = "mocha"
    elseif Style.colorscheme == "catppuccin_macchiato" then
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
}
