local Style = require("config.style")

return {
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
    local search_style = Style.FZF_LUA(false, colors)

    return {
      overrides = vim.tbl_deep_extend(
        "force",
        search_style.hlgroups,
        search_style.styles,
        Style.NvimTree(colors),
        Style.LSP(colors),
        Style.CMP_BLINK(colors),
        Style.TreeSitter(colors)
      ),
    }
  end,
}
