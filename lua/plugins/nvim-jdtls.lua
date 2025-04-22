return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
      local javalsp = require "configs.java"
      local lsp = require "configs.lsp"
      local lombok = string.format("-javaagent:%s", javalsp.lombok_jar)
      local equinox_jar = javalsp.equinox_jar()
      local add_modules = javalsp.add_modules()
      local jdtls_config_dir = javalsp.jdtls_config_dir()
      local jdtls_workspace_dir = javalsp.jdtls_workspace_dir()
      local config = {
        flags = {
          debounce_text_changes = 300,
        },
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dosgi.checkConfiguration=true",
          "-Dosgi.sharedConfiguration.area=" .. jdtls_config_dir,
          "-Dosgi.sharedConfiguration.area.readOnly=true",
          "-Dosgi.configuration.cascaded=true",
          "-Dorg.eclipse.lsp4j.trace=verbose",
          "-Xmx2G",
          "-Xms512M",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          add_modules,
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          lombok,
          "-jar",
          equinox_jar,
          "-configuration",
          jdtls_config_dir,
          "-data",
          jdtls_workspace_dir,
        },

        root_dir = javalsp.root_dir,
        single_file_support = true,
        init_options = javalsp.init_options,
        handlers = javalsp.handler,

        capabilities = javalsp.capabilities,
        on_attach = javalsp.on_attach,
        on_init = lsp.on_init,

        settings = {
          java = {
            saveActions = {
              organizeImports = true,
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
          },
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
