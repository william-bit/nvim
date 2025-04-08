local lspconfig = require "lspconfig"
local lsp = require "configs.lsp"

lsp.defaults()

-- lsps with default config
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    if server_name ~= "lua_ls" and server_name ~= "jdtls" and server_name ~= "gradle_ls" then
      lspconfig[server_name].setup {
        on_attach = lsp.on_attach,
        on_init = lsp.on_init,
        capabilities = lsp.capabilities,
      }
    end
  end,
}

lspconfig.gradle_ls.setup {
  on_attach = lsp.on_attach,
  on_init = lsp.on_init,
  capabilities = lsp.capabilities,
  filetypes = { "groovy" },
  root_dir = require("lspconfig.util").root_pattern(
    "settings.gradle", -- Gradle (multi-project)
    "build.gradle" -- Gradle
  ),
  cmd = { "gradle-language-server.cmd" },
  -- gradle-language-server expects init_options.settings to be defined
  init_options = {
    settings = {
      gradleWrapperEnabled = true,
    },
  },
}
