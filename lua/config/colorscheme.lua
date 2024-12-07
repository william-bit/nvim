---@class Colors
---@field black string,
---@field black2 string,
---@field darker_black string,
---@field one_bg string,
---@field purple string,
---@field one_bg2 string,
---@field one_bg3 string,
---@field white string,
---@field white2 string,
---@field blue string,
---@field bright_blue string,
---@field green string,
---@field red string,
---@field yellow string,
---@field bright_yellow string,

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

---@param colors Colors
function Style.TreeSitter(colors)
  return {
    ["@tag"] = { fg = colors.bright_blue },
    ["@tag.builtin"] = { fg = colors.white2 },
    ["@tag.attribute"] = { fg = colors.bright_yellow },
    ["@variable.parameter"] = { fg = colors.white2 },
    ["@type"] = { fg = colors.bright_yellow },
    ["@keyword.return"] = { fg = colors.red },
    ["@keyword.function"] = { fg = colors.purple },
    ["@function.call"] = { fg = colors.bright_blue },
    ["@function.method.call"] = { fg = colors.bright_blue },
    ["@function.method"] = { fg = colors.white2 },
    ["@function"] = { fg = colors.white2 },
  }
end

---@param colors Colors
function Style.LSP(colors)
  return {
    ["@lsp.type.parameter"] = { fg = colors.white2 },
    ["@lsp.type.interface"] = { fg = colors.bright_yellow },
    ["@lsp.type.type"] = { fg = colors.bright_yellow },
  }
end

return Style
