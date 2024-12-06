---@class Colors
---@field black string,
---@field black2 string,
---@field darker_black string,
---@field one_bg string,
---@field purple string,
---@field one_bg2 string,
---@field one_bg3 string,
---@field white string,
---@field blue string,
---@field green string,
---@field red string,
---@field yellow string,

---@class M
local Style = {}

---@param colors Colors
---@param border boolean
function Style.Telescope(border, colors)
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

---@param colors Colors
function Style.NvimTree(colors)
  return {
    NvimTreeNormal = { bg = colors.black },
    NvimTreeNormalNC = { bg = colors.black },

    NvimTreeEmptyFolderName = { fg = colors.green },
    NvimTreeEndOfBuffer = { fg = colors.darker_black },
    NvimTreeFolderIcon = { fg = colors.white },
    NvimTreeFolderName = { fg = colors.green },
    NvimTreeFolderArrowOpen = { fg = colors.green },
    NvimTreeFolderArrowClosed = { fg = colors.white },
    NvimTreeIndentMarker = { fg = colors.one_bg2 },
    NvimTreeOpenedFolderName = { fg = colors.green },

    NvimTreeGitNew = { fg = colors.yellow },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitDirty = { fg = colors.red },
    NvimTreeGitIgnored = { fg = colors.white },

    NvimTreeGitFileDirtyHL = { fg = colors.yellow },
    NvimTreeGitFileIgnoredHL = { fg = colors.one_bg3 },
    NvimTreeGitFileMergeHL = { fg = colors.purple },
    NvimTreeGitFileNewHL = { fg = colors.red },
    NvimTreeGitFileDeletedHL = { fg = colors.red },
    NvimTreeGitFileStagedHL = { fg = colors.blue },

    NvimTreeWinSeparator = {
      fg = colors.one_bg3,
      bg = colors.black,
    },

    NvimTreeWindowPicker = {
      fg = colors.red,
      bg = colors.black2,
    },

    NvimTreeCursorLine = {
      bg = colors.black,
    },

    NvimTreeSpecialFile = {
      fg = colors.yellow,
      bold = true,
    },

    NvimTreeRootFolder = {
      fg = colors.red,
      bold = true,
    },
  }
end

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      local palatte = require("gruvbox").palette
      local colors = {
        darker_black = palatte.dark0_hard,
        black = palatte.dark0,
        black2 = palatte.dark0_soft,
        one_bg = palatte.dark1,
        one_bg2 = palatte.dark2,
        one_bg3 = palatte.dark3,
        white = palatte.light1,
        blue = palatte.neutral_blue,
        purple = palatte.bright_purple,
        green = palatte.bright_green,
        red = palatte.bright_red,
        yellow = palatte.neutral_yellow,
      }
      local telescope_style = Style.Telescope(false, colors)

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
          Style.NvimTree(colors),
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
