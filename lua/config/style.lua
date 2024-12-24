---@class Colors
---@field black string,
---@field black2 string,
---@field darker_black string,
---@field black3 string,
---@field purple string,
---@field black4 string,
---@field black5 string,
---@field white string,
---@field white2 string,
---@field bright_purple string,
---@field aqua string,
---@field bright_aqua string,
---@field blue string,
---@field bright_blue string,
---@field green string,
---@field red string,
---@field yellow string,
---@field bright_yellow string,
---@field orange string,
---@field bright_orange string,

---@class M
local Style = {}

---@type "catppuccin_latte" | "catppuccin_mocha" | "catppuccin_macchiato" | "catppuccin_frappe" | "gruvbox" | 'tokyonight-night' | 'tokyonight-storm' | 'tokyonight-day' | 'tokyonight-moon'
Style.colorscheme = "gruvbox"

---@param colors Colors
---@param border boolean
function Style.Telescope(border, colors)
  local hlgroups = {

    TelescopePromptTitle = { fg = colors.black, bg = colors.red },

    TelescopeSelection = { bg = colors.black2, fg = colors.white },
    TelescopeResultsDiffAdd = { fg = colors.green },
    TelescopeResultsDiffChange = { fg = colors.yellow },
    TelescopeResultsDiffDelete = { fg = colors.red },

    TelescopeMatching = { bg = colors.black3, fg = colors.blue },
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
      TelescopeBorder = { fg = colors.black4 },
      TelescopePromptBorder = { fg = colors.black4 },
      TelescopeResultsBorder = { fg = colors.black4 },
      TelescopePreviewBorder = { fg = colors.black4 },
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
---@param border boolean
function Style.FZF_LUA(border, colors)
  local hlgroups = {
    FzfLuaTitle = { bg = colors.red, fg = colors.black },
    FzfLuaFzfHeader = { fg = colors.bright_blue },
    FzfLuaSearch = { bg = colors.black2, fg = colors.white },
  }

  local styles = {
    borderless = {
      FzfLuaNormal = { fg = colors.white, bg = colors.black },
      FzfLuaBorder = { fg = colors.black, bg = colors.black },
      FzfLuaPreviewBorder = { fg = colors.black2, bg = colors.black2 },
      FzfLuaPreviewTitle = { fg = colors.black2, bg = colors.green },
      FzfLuaPreviewNormal = { bg = colors.black2 },
    },

    bordered = {
      FzfLuaNormal = { bg = colors.black },
      FzfLuaBorder = { fg = colors.black4 },
      FzfLuaPreviewBorder = { fg = colors.black4 },
      FzfLuaPreviewTitle = { fg = colors.black, bg = colors.blue },
      FzfLuaPreviewNormal = { bg = colors.black },
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
    NvimTreeIndentMarker = { fg = colors.black4 },
    NvimTreeOpenedFolderName = { fg = colors.green },

    NvimTreeGitNew = { fg = colors.yellow },
    NvimTreeGitDeleted = { fg = colors.red },
    NvimTreeGitDirty = { fg = colors.red },
    NvimTreeGitIgnored = { fg = colors.white },

    NvimTreeGitFileDirtyHL = { fg = colors.yellow },
    NvimTreeGitFileIgnoredHL = { fg = colors.black5 },
    NvimTreeGitFileMergeHL = { fg = colors.purple },
    NvimTreeGitFileNewHL = { fg = colors.red },
    NvimTreeGitFileDeletedHL = { fg = colors.red },
    NvimTreeGitFileStagedHL = { fg = colors.blue },

    NvimTreeWinSeparator = {
      fg = colors.black5,
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
    ["@keyword.function"] = { fg = colors.bright_purple },
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
---@param colors Colors
function Style.CMP(colors)
  -- custom highlights per style!
  local styles_base = {
    PmenuSel = { bg = colors.white, fg = "NONE" },
    Pmenu = { fg = colors.bright_blue, bg = colors.black },

    CmpItemAbbrDeprecated = { fg = colors.black4, bg = "NONE", strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.bright_blue, bg = "NONE", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.bright_blue, bg = "NONE", bold = true },
    CmpItemMenu = { fg = colors.bright_purple, bg = "NONE", italic = true },
  }
  local style_item = {
    CmpItemKindField = { bg = colors.black3, fg = colors.red },
    CmpItemKindProperty = { bg = colors.black3, fg = colors.red },
    CmpItemKindEvent = { bg = colors.black3, fg = colors.red },

    CmpItemKindText = { bg = colors.black3, fg = colors.green },
    CmpItemKindEnum = { bg = colors.black3, fg = colors.green },
    CmpItemKindKeyword = { bg = colors.black3, fg = colors.green },

    CmpItemKindConstant = { bg = colors.black3, fg = colors.bright_yellow },
    CmpItemKindConstructor = { bg = colors.black3, fg = colors.bright_yellow },
    CmpItemKindReference = { bg = colors.black3, fg = colors.bright_yellow },

    CmpItemKindFunction = { bg = colors.black3, fg = colors.bright_purple },
    CmpItemKindStruct = { bg = colors.black3, fg = colors.bright_purple },
    CmpItemKindClass = { bg = colors.black3, fg = colors.bright_purple },
    CmpItemKindModule = { bg = colors.black3, fg = colors.bright_purple },
    CmpItemKindOperator = { bg = colors.black3, fg = colors.bright_purple },

    CmpItemKindVariable = { bg = colors.black3, fg = colors.white },
    CmpItemKindFile = { bg = colors.black3, fg = colors.white },

    CmpItemKindUnit = { bg = colors.black3, fg = colors.bright_orange },
    CmpItemKindSnippet = { bg = colors.black3, fg = colors.bright_orange },
    CmpItemKindFolder = { bg = colors.black3, fg = colors.bright_orange },

    CmpItemKindMethod = { bg = colors.black3, fg = colors.blue },
    CmpItemKindValue = { bg = colors.black3, fg = colors.blue },
    CmpItemKindEnumMember = { bg = colors.black3, fg = colors.blue },

    CmpItemKindInterface = { bg = colors.black3, fg = colors.blue },
    CmpItemKindColor = { bg = colors.black3, fg = colors.aqua },
    CmpItemKindTypeParameter = { bg = colors.black3, fg = colors.aqua },

    CmpItemKindCopilot = { bg = colors.black3, fg = colors.bright_blue },
    CmpItemKindCodeium = { bg = colors.black3, fg = colors.bright_blue },
    CmpItemKindTabNine = { bg = colors.black3, fg = colors.bright_blue },
    CmpItemKindSuperMaven = { bg = colors.black3, fg = colors.bright_blue },
  }
  return vim.tbl_extend("force", styles_base, style_item)
end

function Style.CMP_BLINK(colors)
  -- custom highlights per style!
  local styles_base = {
    BlinkCmpMenu = { fg = colors.bright_blue, bg = colors.black3 },
    BlinkCmpMenuSelection = { bg = colors.white4, fg = "NONE" },

    BlinkCmpLabelDeprecated = { fg = colors.black5, bg = "NONE", strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.bright_blue, bg = "NONE", bold = true },
    BlinkCmpKind = { fg = colors.bright_purple, bg = "NONE", italic = true },
  }
  local style_item = {
    BlinkCmpKindField = { bg = "NONE", fg = colors.red },
    BlinkCmpKindProperty = { bg = "NONE", fg = colors.red },
    BlinkCmpKindEvent = { bg = "NONE", fg = colors.red },

    BlinkCmpKindText = { bg = "NONE", fg = colors.green },
    BlinkCmpKindEnum = { bg = "NONE", fg = colors.green },
    BlinkCmpKindKeyword = { bg = "NONE", fg = colors.green },

    BlinkCmpKindConstant = { bg = "NONE", fg = colors.bright_yellow },
    BlinkCmpKindConstructor = { bg = "NONE", fg = colors.bright_yellow },
    BlinkCmpKindReference = { bg = "NONE", fg = colors.bright_yellow },

    BlinkCmpKindFunction = { bg = "NONE", fg = colors.bright_purple },
    BlinkCmpKindStruct = { bg = "NONE", fg = colors.bright_purple },
    BlinkCmpKindClass = { bg = "NONE", fg = colors.bright_purple },
    BlinkCmpKindModule = { bg = "NONE", fg = colors.bright_purple },
    BlinkCmpKindOperator = { bg = "NONE", fg = colors.bright_purple },

    BlinkCmpKindVariable = { bg = "NONE", fg = colors.white },
    BlinkCmpKindFile = { bg = "NONE", fg = colors.white },

    BlinkCmpKindUnit = { bg = "NONE", fg = colors.bright_orange },
    BlinkCmpKindSnippet = { bg = "NONE", fg = colors.bright_orange },
    BlinkCmpKindFolder = { bg = "NONE", fg = colors.bright_orange },

    BlinkCmpKindMethod = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindValue = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindEnumMember = { bg = "NONE", fg = colors.blue },

    BlinkCmpKindInterface = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindColor = { bg = "NONE", fg = colors.aqua },
    BlinkCmpKindTypeParameter = { bg = "NONE", fg = colors.aqua },

    BlinkCmpKindCopilot = { bg = "NONE", fg = colors.bright_blue },
    BlinkCmpKindCodeium = { bg = "NONE", fg = colors.bright_blue },
    BlinkCmpKindTabNine = { bg = "NONE", fg = colors.bright_blue },
    BlinkCmpKindSuperMaven = { bg = "NONE", fg = colors.bright_blue },
  }
  return vim.tbl_extend("force", styles_base, style_item)
end
Style.CMP_ICONS = {
  Array = " ",
  Boolean = "󰨙 ",
  Class = " ",
  Codeium = "󰘦 ",
  Color = " ",
  Control = " ",
  Collapsed = " ",
  Constant = "󰏿 ",
  Constructor = " ",
  Copilot = " ",
  Enum = " ",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = "󰊕 ",
  Interface = " ",
  Key = "⧪ ",
  Keyword = " ",
  Method = "󰊕 ",
  Module = " ",
  Namespace = "󰦮 ",
  Null = "␤ ",
  Number = "󰎠 ",
  Object = " ",
  Operator = " ",
  Package = " ",
  Property = " ",
  Reference = " ",
  Snippet = "▢ ",
  String = " ",
  Struct = "󰆼 ",
  Supermaven = " ",
  TabNine = "󰏚 ",
  Text = "Ͳ ",
  TypeParameter = " ",
  Unit = " ",
  Value = "❖ ",
  Variable = "󰀫 ",
}

return Style
