---@class Colors
---@field white string,
---@field black string, -- usually your theme bg
---@field darker_black string, -- 6% darker than black
---@field black2 string, -- 6% lighter than black
---@field one_bg string, -- 10% lighter than black
---@field one_bg2 string, -- 6% lighter than one_bg2
---@field one_bg3 string, -- 6% lighter than one_bg3
---@field grey string, -- 40% lighter than black (the % here depends so choose the perfect grey!)
---@field grey_fg string, -- 10% lighter than grey
---@field grey_fg2 string, -- 5% lighter than grey
---@field light_grey string,
---@field red string,
---@field baby_pink string,
---@field pink string,
---@field line string, -- 15% lighter than black
---@field green string,
---@field vibrant_green string,
---@field nord_blue string,
---@field blue string,
---@field seablue string,
---@field yellow string, -- 8% lighter than yellow
---@field sun string,
---@field purple string,
---@field dark_purple string,
---@field teal string,
---@field orange string,
---@field cyan string,
---@field statusline_bg string,
---@field lightbg string,
---@field pmenu_bg string,
---@field folder_bg string

---@class M
local Style = {
  colors = {
    white = "white",
    black = "black",
    darker_black = "darker_black",
    black2 = "black2",
    one_bg = "one_bg",
    one_bg2 = "one_bg2",
    one_bg3 = "one_bg3",
    grey = "grey",
    grey_fg = "grey_fg",
    grey_fg2 = "grey_fg2",
    light_grey = "light_grey",
    red = "red",
    baby_pink = "baby_pink",
    pink = "pink",
    line = "line",
    green = "green",
    vibrant_green = "vibrant_green",
    nord_blue = "nord_blue",
    blue = "blue",
    seablue = "seablue",
    yellow = "yellow",
    sun = "sun",
    purple = "purple",
    dark_purple = "dark_purple",
    teal = "teal",
    orange = "orange",
    cyan = "cyan",
    statusline_bg = "statusline_bg",
    lightbg = "lightbg",
    pmenu_bg = "pmenu_bg",
    folder_bg = "folder_bg",
  },
}

---@param border boolean
function Style.FZF_LUA(border)
  ---@type Colors
  local colors = Style.colors
  local hlgroups = {
    FzfLuaTitle = { bg = colors.red, fg = colors.black },
    FzfLuaFzfHeader = { fg = colors.seablue },
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
      FzfLuaBorder = { fg = colors.grey },
      FzfLuaPreviewBorder = { fg = colors.grey },
      FzfLuaPreviewTitle = { fg = colors.black, bg = colors.blue },
      FzfLuaPreviewNormal = { bg = colors.black },
    },
  }
  return vim.tbl_extend("force", hlgroups, styles[border and "bordered" or "borderless"])
end

function Style.DAP()
  ---@type Colors
  local colors = Style.colors
  -- custom highlights per style!
  local styles_base = {
    DapUINormal = { fg = colors.white, bg = colors.black },
    DapUIPlayPause = { fg = colors.green, bg = colors.black },
    DapUIPlay = { fg = colors.green, bg = colors.black },
    DapUIRestart = { fg = colors.green, bg = colors.black },
    DapUIStop = { fg = colors.red, bg = colors.black },
    DapUIStepBack = { fg = colors.white, bg = colors.black },
    DapUIStepInto = { fg = colors.white, bg = colors.black },
    DapUIStepOut = { fg = colors.white, bg = colors.black },
    DapUIStepOver = { fg = colors.white, bg = colors.black },
    DapUIVariable = { fg = colors.white, bg = colors.black },
  }
  local style_item = {
    DapUIBreakpointsCurrent = { fg = colors.red },
    DapUIBreakpointsDisabled = { fg = colors.grey },
    DapUIBreakpointsError = { fg = colors.red },
    DapUIBreakpointsInfo = { fg = colors.seablue },
    DapUIBreakpointsLine = { fg = colors.seablue },
    DapUIBreakpointsPath = { fg = colors.seablue },
    DapUIBreakpointsRejected = { fg = colors.grey },
    DapUIBreakpointsSource = { fg = colors.seablue },

    DapUIScope = { fg = colors.seablue },
    DapUIType = { fg = colors.seablue },
    DapUIValue = { fg = colors.seablue },
    DapUIModifiedValue = { fg = colors.seablue },
    DapUIDecoration = { fg = colors.seablue },

    DapUIWatchesEmpty = { fg = colors.grey },
    DapUIWatchesValue = { fg = colors.seablue },
    DapUIWatchesError = { fg = colors.red },
  }
  local signs = {
    DapBreakpoint = { fg = colors.red },
    DapBreakpointCondition = { fg = colors.red },
    DapBreakpointRejected = { fg = colors.grey },
    DapStopped = { fg = colors.green },
    DapLogPoint = { fg = colors.seablue },
  }


  return vim.tbl_extend("force", styles_base, style_item, signs)
end

function Style.CMP_BLINK()
  ---@type Colors
  local colors = Style.colors
  -- custom highlights per style!
  local styles_base = {
    BlinkCmpMenu = { fg = colors.seablue, bg = colors.black2 },
    BlinkCmpMenuSelection = { bg = colors.grey, fg = "NONE" },

    BlinkCmpLabelDescription = { fg = colors.light_grey },
    BlinkCmpLabelDetail = { fg = colors.nord_blue },
    BlinkCmpLabelDeprecated = { fg = colors.grey, bg = "NONE", strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.seablue, bg = "NONE", bold = true },
    BlinkCmpKind = { fg = colors.purple, bg = "NONE", italic = true },
  }
  local style_item = {
    BlinkCmpKindField = { bg = "NONE", fg = colors.red },
    BlinkCmpKindProperty = { bg = "NONE", fg = colors.red },
    BlinkCmpKindEvent = { bg = "NONE", fg = colors.red },

    BlinkCmpKindText = { bg = "NONE", fg = colors.green },
    BlinkCmpKindEnum = { bg = "NONE", fg = colors.green },
    BlinkCmpKindKeyword = { bg = "NONE", fg = colors.green },

    BlinkCmpKindConstant = { bg = "NONE", fg = colors.yellow },
    BlinkCmpKindConstructor = { bg = "NONE", fg = colors.yellow },
    BlinkCmpKindReference = { bg = "NONE", fg = colors.yellow },

    BlinkCmpKindFunction = { bg = "NONE", fg = colors.purple },
    BlinkCmpKindStruct = { bg = "NONE", fg = colors.purple },
    BlinkCmpKindClass = { bg = "NONE", fg = colors.purple },
    BlinkCmpKindModule = { bg = "NONE", fg = colors.purple },
    BlinkCmpKindOperator = { bg = "NONE", fg = colors.purple },

    BlinkCmpKindVariable = { bg = "NONE", fg = colors.white },
    BlinkCmpKindFile = { bg = "NONE", fg = colors.white },

    BlinkCmpKindUnit = { bg = "NONE", fg = colors.orange },
    BlinkCmpKindSnippet = { bg = "NONE", fg = colors.orange },
    BlinkCmpKindFolder = { bg = "NONE", fg = colors.orange },

    BlinkCmpKindMethod = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindValue = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindEnumMember = { bg = "NONE", fg = colors.blue },

    BlinkCmpKindInterface = { bg = "NONE", fg = colors.blue },
    BlinkCmpKindColor = { bg = "NONE", fg = colors.seablue },
    BlinkCmpKindTypeParameter = { bg = "NONE", fg = colors.seablue },

    BlinkCmpKindCopilot = { bg = "NONE", fg = colors.seablue },
    BlinkCmpKindCodeium = { bg = "NONE", fg = colors.seablue },
    BlinkCmpKindTabNine = { bg = "NONE", fg = colors.seablue },
    BlinkCmpKindSuperMaven = { bg = "NONE", fg = colors.seablue },
  }
  return vim.tbl_extend("force", styles_base, style_item)
end

function Style.FOLDS()
  ---@type Colors
  local colors = Style.colors
  -- custom highlights per style!
  return {
    LineNr = { fg = colors.grey },
    -- FoldColumn = { fg = colors.red },
    -- Folded = { fg = colors.red },
    -- SignColumn = { fg = colors.red },
    -- FoldText = { fg = colors.red },
  }
end

return vim.tbl_extend(
  "force",
  Style.FZF_LUA(false),
  Style.FOLDS(),
  Style.CMP_BLINK(),
  Style.DAP()
)
