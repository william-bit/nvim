return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local javalsp = require "configs.java"
      local lsp = require "configs.lsp"
      local lombok = string.format("--jvm-arg=-javaagent:%s", javalsp.lombok_jar)
      local equinox_jar = javalsp.equinox_jar()
      local jdtls_location = vim.fn.exepath "jdtls"
      local jdtls_config_dir = javalsp.jdtls_config_dir()
      local jdtls_workspace_dir = javalsp.jdtls_workspace_dir()
      local config = {
        cmd = {
          jdtls_location,
          lombok,
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms512m",
          "-Xmx2g",
          "-Xss2m",
          "--add-modules jdk.incubator.vector",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
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
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
          },
        },
      }

      require("jdtls").start_or_attach(config)
    end,
  },
}
