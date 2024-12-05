---@class Colors
---@field black string,
---@field black2 string,
---@field darker_black string,
---@field one_bg string,
---@field one_bg2 string,
---@field white string,
---@field blue string,
---@field green string,
---@field red string,
---@field yellow string,

---@class M
local Telescope = {}

---@param colors Colors
---@param border boolean
function Telescope.style(border, colors)
  local hlgroups = {

    TelescopePromptTitle = { fg = colors.black, bg = colors.red },

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
      TelescopePreviewTitle = { fg = colors.black, bg = colors.green },
      TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
      TelescopeNormal = { bg = colors.darker_black },
    },

    bordered = {
      TelescopeBorder = { fg = colors.one_bg2 },
      TelescopePromptBorder = { fg = colors.one_bg2 },
      TelescopeResultsBorder = { fg = colors.one_bg2 },
      TelescopePreviewBorder = { fg = colors.one_bg2 },
      TelescopePromptNormal = { bg = colors.black },
      TelescopeResultsTitle = { fg = colors.black, bg = colors.green },
      TelescopePreviewTitle = { fg = colors.black, bg = colors.blue },
      TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
      TelescopeNormal = { bg = colors.black },
    },
  }
  return { hlgroups = hlgroups, styles = styles[border and "bordered" or "borderless"] }
end

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      local colors = require("gruvbox").palette
      local telescope_style = Telescope.style(false, {
        darker_black = colors.dark0_hard,
        black = colors.dark0,
        black2 = colors.dark0_soft,
        one_bg = colors.dark1,
        one_bg2 = colors.dark2,
        white = colors.light1,
        blue = colors.neutral_blue,
        green = colors.bright_green,
        red = colors.bright_red,
        yellow = colors.neutral_yellow,
      })

      local tree_sitter_style = {
        ["@tag"] = { fg = colors.bright_blue },
        ["@tag.builtin"] = { fg = colors.light2 },
        ["@tag.attribute"] = { fg = colors.bright_yellow },
        ["@variable.parameter"] = { fg = colors.light2 },
        ["@type"] = { fg = colors.bright_yellow },
        ["@keyword.return"] = { fg = colors.bright_red },
        ["@keyword.function"] = { fg = colors.bright_purple },
        ["@function.call"] = { fg = colors.bright_blue },
        ["@function.method.call"] = { fg = colors.bright_blue },
        ["@function.method"] = { fg = colors.light2 },
        ["@function"] = { fg = colors.light2 },
      }

      local lsp_style = {
        ["@lsp.type.parameter"] = { fg = colors.light2 },
        ["@lsp.type.interface"] = { fg = colors.bright_yellow },
        ["@lsp.type.type"] = { fg = colors.bright_yellow },
      }

      require("gruvbox").setup({
        overrides = vim.tbl_deep_extend(
          "force",
          telescope_style.hlgroups,
          telescope_style.styles,
          lsp_style,
          tree_sitter_style
        ),
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
