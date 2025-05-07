local lsp = require "configs.lsp.default"

lsp.defaults()

vim.lsp.config.lua_ls = {
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
  on_init = lsp.on_init,

  settings = {
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
  },
}

vim.lsp.config.gradle_ls = {
  on_attach = lsp.on_attach,
  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  filetypes = { "groovy" },
  root_dir = require("lspconfig.util").root_pattern(
    "settings.gradle", -- Gradle (multi-project)
    "build.gradle" -- Gradle
  ),
  cmd = { "gradle-language-server" },
  -- gradle-language-server expects init_options.settings to be defined
  init_options = {
    settings = {
      gradleWrapperEnabled = true,
    },
  },
}

vim.lsp.enable { "gradle_ls", "lua_ls" }
