return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
      local javalsp = require "configs.java"
      local lombok = string.format("-javaagent:%s", javalsp.lombok_jar)
      local equinox_jar = javalsp.equinox_jar()
      local add_modules = javalsp.add_modules()
      local jdtls_config_dir = javalsp.jdtls_config_dir()
      local jdtls_workspace_dir = javalsp.jdtls_workspace_dir()
      local config = {
        flags = {
          allow_incremental_sync = true,
          debounce_text_changes = 300,
        },
        cmd = {
          "java",
          "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044",
          lombok,
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Xmx2G",
          "-Xms512M",
          "-Dlog.level=ALL",
          "-jar",
          equinox_jar,
          "-configuration",
          jdtls_config_dir,
          "-data",
          jdtls_workspace_dir,
          add_modules,
          "--add-opens java.base/java.util=ALL-UNNAMED",
          "--add-opens java.base/java.lang=ALL-UNNAMED",
        },

        root_dir = javalsp.root_dir,
        single_file_support = true,
        init_options = javalsp.init_options,
        handlers = javalsp.handler,

        capabilities = javalsp.capabilities,
        on_attach = javalsp.on_attach,

        settings = {
          java = {
            references = {
              includeDecompiledSources = true,
            },
            eclipse = {
              downloadSources = true,
            },
            maven = {
              downloadSources = true,
            },
            saveActions = {
              organizeImports = true,
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
              filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
              },
              importOrder = {
                "java",
                "javax",
                "com",
                "org",
              },
            },
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              useBlocks = true,
            },
            sources = {
              organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
              },
            },
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
            },
          },
        },
      }

      config.on_init = function(client, _)
        client.notify("workspace/didChangeConfiguration", { settings = config.settings })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function()
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
