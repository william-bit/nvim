local Style = require("config.style")

return {
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
        local search_style = Style.FZF_LUA(false, colors)
        local colors_table = vim.tbl_deep_extend(
          "force",
          search_style.hlgroups,
          search_style.styles,
          Style.NvimTree(colors),
          Style.LSP(colors),
          Style.CMP_BLINK(colors),
          Style.TreeSitter(colors)
        )
        for group, color in pairs(colors_table) do
          hl[group] = color
        end
      end,
    }
  end,
}
