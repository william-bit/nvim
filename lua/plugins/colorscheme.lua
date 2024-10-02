---@class Colors
---@field black string,
---@field black2 string,
---@field blue string,
---@field darker_black string,
---@field green string,
---@field one_bg string,
---@field one_bg3 string,
---@field red string,
---@field white string,
---@field yellow string,

---@class M
---@field style "bordered" | "borderless"
local M = {
  style = "borderless",
}

---@param colors Colors
function M.telescope_style(colors)
  local hlgroups = {

    TelescopePromptPrefix = {
      fg = colors.red,
      bg = colors.black2,
    },

    TelescopeNormal = { bg = colors.darker_black },

    TelescopePreviewTitle = {
      fg = colors.black,
      bg = colors.green,
    },

    TelescopePromptTitle = {
      fg = colors.black,
      bg = colors.red,
    },

    TelescopeSelection = { bg = colors.black2, fg = colors.white },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },

    TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
  }

  local styles = {
    borderless = {
      TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
      TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
      TelescopeResultsBorder = { bg = colors.darker_black, fg = colors.darker_black },
      TelescopePreviewBorder = { bg = colors.darker_black, fg = colors.darker_black },
      TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
      TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.darker_black },
      TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
    },

    bordered = {
      TelescopeBorder = { fg = colors.one_bg3 },
      TelescopePromptBorder = { fg = colors.one_bg3 },
      TelescopeResultsBorder = { fg = colors.one_bg3 },
      TelescopePreviewBorder = { fg = colors.one_bg3 },
      TelescopeResultsTitle = { fg = colors.black, bg = colors.green },
      TelescopePreviewTitle = { fg = colors.black, bg = colors.blue },
      TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
      TelescopeNormal = { bg = colors.black },
      TelescopePromptNormal = { bg = colors.black },
    },
  }
  return { hlgroups = hlgroups, styles = styles[M.style] }
end

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      local colors = require("gruvbox").palette

      local telescope_style = M.telescope_style({
        black = colors.dark0,
        black2 = colors.dark0_soft,
        blue = colors.neutral_blue,
        darker_black = colors.dark0_hard,
        green = colors.bright_green,
        one_bg = colors.dark1,
        one_bg3 = colors.dark2,
        red = colors.bright_red,
        white = colors.light1,
        yellow = colors.neutral_yellow,
      })

      require("gruvbox").setup({
        overrides = vim.tbl_deep_extend("force", telescope_style.hlgroups, telescope_style.styles),
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
