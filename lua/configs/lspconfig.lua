local lsp = require "configs.lsp.default"

lsp.defaults()

vim.lsp.config.lua_ls.settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using
      -- (most likely LuaJIT in the case of Neovim)
      version = "LuaJIT",
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      maxPreload = 100000,
      preloadFileSize = 10000,
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.config.gradle_ls = {
  filetypes = { "groovy" },
  root_markers = {
    "settings.gradle", -- Gradle (multi-project)
    "build.gradle", -- Gradle
  },
  cmd = { "gradle-language-server" },
  -- gradle-language-server expects init_options.settings to be defined
  init_options = {
    settings = {
      gradleWrapperEnabled = true,
    },
  },
}
