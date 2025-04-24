return {
  {
    "Exafunction/windsurf.nvim",
    enabled = false,
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
      "SupermavenUsePro",
    },
    config = true,
    opts = {
      -- your config here
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
      keymaps = {
        accept_suggestion = "<c-l>",
      },
    },
  },
  "saghen/blink.compat",
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    -- use a release tag to download pre-built binaries
    opts = {
      snippets = { preset = "luasnip" },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { "supermaven", "lsp", "cmdline", "path", "snippets", "buffer", "omni" },
        providers = {
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            enabled = true,
            timeout_ms = 1000,
          },
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 100,
            async = true,
            transform_items = function(ctx, items)
              for _, item in ipairs(items) do
                item.kind_icon = " "
                item.kind_name = "Supermaven"
              end
              return items
            end,
          },
          codeium = {
            name = "codeium",
            module = "blink.compat.source",
            score_offset = 90,
            async = true,
            transform_items = function(ctx, items)
              for _, item in ipairs(items) do
                item.kind_icon = "󰘦 "
                item.kind_name = "Codeium"
              end
              return items
            end,
          },
        },
      },
      keymap = {
        preset = "default",
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-j>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Enter>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
      cmdline = {
        completion = { ghost_text = { enabled = false } },
        keymap = {
          preset = "default",
          ["<Enter>"] = { "select_and_accept", "fallback" },
          ["<Tab>"] = { "show", "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
        },
      },
      completion = {
        ghost_text = { enabled = false },
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          draw = {
            columns = { { "kind_icon", gap = 10 }, { "label", "label_description" }, { "kind" } },
            treesitter = { "lsp" },
          },
        },
      },
      appearance = {
        kind_icons = {
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
        },
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    config = true,
    event = "BufReadPost",
  },
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "gl", "<Plug>ReplaceWithRegisterOperator", desc = "ReplaceWithRegister Operator" },
      { "glr", "<Plug>ReplaceWithRegisterLine", desc = "ReplaceWithRegister Line" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "typescript",
      "vue",
      "astro",
      "glimmer",
      "handlebars",
      "javascriptreact",
      "typescriptreact",
      "markdown",
      "php",
      "blade",
      "rescript",
      "svelte",
      "twig",
    },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
    },
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<c-o>", "<cmd>FzfLua buffers<CR>" },
      { "<c-f>", "<cmd>FzfLua live_grep<CR>" },
      { "<c-p>", "<cmd>FzfLua files<CR>" },
      { "<c-t>", "<cmd>FzfLua git_status<CR>" },
      { "<c-i>", "<cmd>FzfLua oldfiles<CR>" },
      { "gD", "<cmd>FzfLua lsp_declarations<CR>", desc = "Lsp Go to declaration", mode = { "n" } },
      { "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Lsp Go to definition", mode = { "n" } },
      { "gy", "<cmd>FzfLua lsp_definitions<CR>", desc = "Lsp Document Symbol", mode = { "n" } },
      { "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Lsp Go to implementation", mode = { "n" } },
      { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Lsp Go to references", mode = { "n" } },
      { "g.", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Lsp code action", mode = { "n" } },
      { "<leader>D", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Lsp Go to type definition", mode = { "n" } },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>", mode = { "n" } },
    },
    opts = function()
      -- use `fzf-lua` for replace vim.ui.select
      require("fzf-lua").register_ui_select()
      return {
        keymap = {
          fzf = {
            -- Send finding to quick fix like telescope
            ["ctrl-q"] = "select-all+accept",
          },
        },
        oldfiles = {
          color_icons = false,
          stat_file = true, -- verify files exist on disk
        },
        files = {
          previewer = false,
          color_icons = false,
          path_shorten = false,
          multiprocess = true,
        },
        grep = {
          color_icons = false,
          path_shorten = true,
          multiprocess = true,
        },
        buffers = {
          color_icons = false,
          path_shorten = true,
        },
        git = {
          files = {
            color_icons = false,
          },
          status = {
            color_icons = false,
          },
        },
        lsp = {
          color_icons = false,
          code_actions = {
            previewer = false,
          },
        },
        ui_select = function(fzf_opts, items)
          return vim.tbl_deep_extend("force", fzf_opts, {
            prompt = " ",
            winopts = {
              title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
              title_pos = "center",
            },
          }, fzf_opts.kind == "codeaction" and {
            winopts = {
              layout = "vertical",
              -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
              width = 0.5,
              preview = {
                layout = "vertical",
                vertical = "down:15,border-top",
              },
            },
          } or {
            winopts = {
              width = 0.5,
              -- height is number of items, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
            },
          })
        end,
      }
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      dofile(vim.g.base46_cache .. "git")
      return {
        signs = {
          delete = { text = "󰍵" },
          changedelete = { text = "󱕖" },
        },
        update_debounce = 1000,
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)
    end,
  },
  {'vim-scripts/dbext.vim',ft = {'sql'}},
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format {
             timeout_ms = 10000,
          }
        end,
        desc = "Format File",
      },
    },
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      require("nvim-treesitter.install").compilers = { "zig" }
      dofile(vim.g.base46_cache .. "treesitter")
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
      -- in my settings
      -- Filetypes --
      vim.filetype.add {
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load {
            paths = {
              "~/AppData/Local/nvim/snippet/phpstorm-snippets-for-vscode",
              vim.fn.stdpath "config" .. "/snippets",
            },
          }
          local list_snips = function()
            local ft_list = require("luasnip").available()[vim.o.filetype]
            local ft_snips = {}
            for _, item in pairs(ft_list) do
              ft_snips[item.trigger] = item.name
            end
            print(vim.inspect(ft_snips))
          end
          vim.api.nvim_create_user_command("LuaSnipListShort", list_snips, {})
        end,
      },
    },

    opts = function()
      local ls = require "luasnip"
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local d = ls.dynamic_node

      ls.add_snippets("go", {
        s({ trig = "!", name = "Not same" }, {
          i(1, "name"),
          t { "!=" },
          i(2, "value"),
        }),
        s({ trig = ";", name = "Create variable" }, {
          i(1, "name"),
          t { ":=" },
          i(2, "value"),
        }),
        s({ trig = ";s", name = "Create variable string" }, {
          i(1, "name"),
          t { ':= "' },
          i(2, "value"),
          t { '"' },
        }),
        s({ trig = "ts", name = "Create struct" }, {
          t { "type " },
          i(1, "name"),
          t { " struct {", "\t" },
          i(2),
          t { "", "}" },
        }),
        s({ trig = "ti", name = "Create interface" }, {
          t { "type " },
          i(1, "name"),
          t { " interface {", "\t" },
          i(2),
          t { "", "}" },
        }),
        s({ trig = "pkg", name = "Create main" }, {
          t { "package main", "", "func main() {", "\t" },
          i(1),
          t { "", "}" },
        }),
      }, {
        key = "go",
      })

      ls.add_snippets("php", {
        s({ trig = ";", name = "go variable" }, {
          t { "$" },
          i(1, "name"),
          t { "=" },
          i(2, "value"),
          t { ";" },
        }),
        s({ trig = ";s", name = "go variable string" }, {
          t { "$" },
          i(1, "name"),
          t { '= "' },
          i(2, "value"),
          t { '";' },
        }),
      }, {
        key = "php",
      })
      return {
        history = true,
        delete_check_events = "TextChanged",
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      dofile(vim.g.base46_cache .. "mason")
      return {
        PATH = "skip",

        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },

        max_concurrent_installers = 10,
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      {
        "rcarriga/nvim-notify",
        opts = function()
          -- Remove notification when cursor changed and new text added
          -- vim.api.nvim_create_autocmd({ "CursorMoved", "TextChangedI" }, {
          --   callback = function()
          --     require("notify").dismiss()
          --   end,
          -- })

          -- Change native notify to vim notify
          return {
            render = "compact",
            stages = "static",
            lsp = {
              -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
              override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
              },
              signature = {
                enabled = false,
              },
            },
          }
        end,
      },
    },
  },
  "nvim-lua/plenary.nvim",
  {
    "nvchad/ui",
    event = "VeryLazy",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/volt", -- optional, needed for theme switcher
    keys = {
      {
        "<leader>th",
        function()
          require("nvchad.themes").open()
        end,
        desc = "select nvchad themes",
        mode = { "n" },
      },
    },
  },
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>di", "<cmd>lua require('dapui').toggle()<cr>" },
    },
    opts = {
      icons = { expanded = "▾", collapsed = "▸" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      sidebar = {
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.25, -- Can be float or integer > 1
          },
          { id = "breakpoints", size = 0.25 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 00.25 },
        },
        size = 40,
        position = "left", -- Can be "left", "right", "top", "bottom"
      },
      tray = {
        elements = { "repl" },
        size = 10,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    },
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },
  -- Ensure java debugger and test packages are installed.
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dd", "<cmd>lua require('dap').toggle_breakpoint()<cr>" },
      { "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>" },
      { "<leader>dc", "<cmd>lua require('dap').continue()<cr>" },
      { "<leader>db", "<cmd>lua require('dap').step_back()<cr>" },
      { "<leader>dn", "<cmd>lua require('dap').step_over()<cr>" },
      { "<leader>ds", "<cmd>lua require('dap').step_into()<cr>" },
      { "<leader>du", "<cmd>lua require('dap').step_out()<cr>" },
      { "<leader>dl", "<cmd>lua require('dap').run_last()<cr>" },
      { "<leader>dt", "<cmd>lua require('dap').terminate()<cr>" },
      { "<leader>dp", "<cmd>lua require('dap').pause.toggle()<cr>" },
      { "<leader>dv", "<cmd>lua require('dap').variables()<cr>" },
      { "<leader>do", "<cmd>lua require('dap').open()<cr>" },
    },
    config = function()
      -- Simple configuration to attach to remote java debug process
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Symbols displayed in the gutter
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "•", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "•", texthl = "DapBreakpointCondition", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "•", texthl = "DapBreakpointRejected", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapStopped",
        { text = "•", texthl = "DapStopped", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapLogPoint",
        { text = "•", texthl = "DapLogPoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )

      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local mason_registry = require "mason-registry"
      if mason_registry.is_installed "php-debug-adapter" then
        local php_dbg_pkg = mason_registry.get_package "php-debug-adapter"
        local php_dbg_path = php_dbg_pkg:get_install_path()
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { php_dbg_path .. "/extension/out/phpDebug.js" },
        }
        dap.configurations.php = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            stopOnEntry = false,
            port = 9000,
            log = true,
            serverSourceRoot = "C:\\laragon\\www\\",
            localSourceRoot = vim.fn.expand "%:p:h" .. "\\",
          },
          {
            type = "php",
            request = "launch",
            name = "Launch current file",
            program = "${file}",
            cwd = "${fileDirname}",
            port = 9003,
          },
          {
            type = "php",
            request = "launch",
            name = "Launch current file (web)",
            program = "${file}",
            cwd = "${fileDirname}",
            port = 9003,
            server = "php",
          },
        }
      end

      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    config = true,
    event = "BufRead",
    keys = {
      { "zM", function() require("ufo").closeAllFolds() end , desc = "Close all folds", mode = { "n" } },
      {  "zR", function() require("ufo").openAllFolds() end , desc = "Open all folds", mode = { "n" } },
    },
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls");
      local javalsp = require "configs.lsp.java"
      local lombok = string.format("-javaagent:%s", javalsp.lombok_jar)
      local equinox_jar = javalsp.equinox_jar()
      local add_modules = javalsp.add_modules()
      local jdtls_config_dir = javalsp.jdtls_config_dir()
      local jdtls_workspace_dir = javalsp.jdtls_workspace_dir()
      local config = {
        flags = {
          allow_incremental_sync = true,
          debounce_text_changes = 1000,
          exit_timeout = false,
        },
        cmd = {
          "java",
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
          java = javalsp.settings,
        },
      }

      config.on_init = function(client, _)
        client.notify("workspace/didChangeConfiguration", { settings = config.settings })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function()
            jdtls.start_or_attach(config)
        end,
      })

    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require "lint"
      -- PHPCS Config
      local phpcs = lint.linters.phpcs
      phpcs.args = {
        "-q",
        "--standard=PSR12",
        "--report=json",
        "-",
      }

      -- Cspell Configaa
      local cspell = lint.linters.cspell
      cspell.args = {
        "lint",
        "--no-color",
        "--no-progress",
        "--no-summary",
        "--config",
        "C:\\Users\\dartmedia\\AppData\\Local\\nvim\\cspell\\settings.jsonc",
      }

      lint.linters_by_ft = {
        php = { "phpcs" },
        json = { "jsonlint" },
        python = { "ruff" },
        docker = { "hadolint" },
        bash = { "shellcheck" },
        sql = { "sqlfluff" },
        text = { "vale" },
        markdown = { "vale" },
        laTeX = { "vale" },
      }

      vim.api.nvim_create_user_command("CspellConfig", function()
        vim.cmd.edit [[~\\AppData\\Local\\nvim\\cspell\\settings.jsonc]]
      end, { nargs = 0, desc = "edit cspell config" })

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
          lint.try_lint "cspell"
        end,
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return {
        override = {
          default_icon = { icon = "󰈚", name = "Default" },
          js = { icon = "󰌞", name = "js" },
          ts = { icon = "󰛦", name = "ts" },
          lock = { icon = "󰌾", name = "lock" },
          ["robots.txt"] = { icon = "󰚩", name = "robots" },
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", mode = { "n" }, desc = "nvimtree focus window" },
      {
        "<A-b>",
        function()
          require("nvim-tree.api").tree.toggle()
        end,
        desc = "nvimtree toggle explorer",
      },
    },
    opts = function()
      dofile(vim.g.base46_cache .. "nvimtree")
      return {
        filters = { dotfiles = false },
        disable_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          width = 40,
          preserve_window_proportions = true,
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 1500,
        },
        renderer = {
          group_empty = true,
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            glyphs = {
              default = "󰈚",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
              },
              git = { unmerged = "" },
            },
          },
        },
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = function()
      local keys = {
        {
          "<c-j>",
          function()
            require("toggleterm").toggle()
          end,
          desc = "terminal toggleable vertical term at button",
          mode = { "n", "t" },
        },
        {
          "<a-i>",
          function()
            require("toggleterm.terminal").Terminal
              :new({ cmd = "lazygit", hidden = true, display_name = "LazyGit" })
              :toggle(10, "float")
          end,
          desc = "Lazygit (Root Dir)",
          mode = { "n", "t" },
        },
      }

      for i = 10, 1, -1 do
        table.insert(keys, {
          "<A-" .. i .. ">",
          function()
            require("toggleterm").toggle(i, 10, "git_dir", "horizontal", "terminal" .. i)
          end,
          desc = "terminal toggleable vertical term " .. i,
          mode = { "n", "t" },
        })
      end
      return keys;
    end,
    opts = {
      shade_terminals = false,
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved",
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        winblend = 4,
        title_pos = "left",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle focus=true<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/twilight.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      require("twilight.init").enable()
      return {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
          inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 3, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "BufRead",
    keys = {
      "<leader>",
      "<c-w>",
      '"',
      "'",
      "`",
      "c",
      "v",
      "g",
      -- Which-key as fix spell check
      {
        "<c-l>",
        function()
          require("which-key").show("z=", { mode = "n", auto = true })
        end,
        desc = "whichkey fix spell check",
        mode = { "n" },
      },
      { "<leader>wK", "<cmd>WhichKey <CR>", mode = { "n" }, desc = "whichkey all keymaps" },
      {
        "<leader>wk",
        function()
          vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
        end,
        desc = "whichkey query lookup",
        mode = { "n" },
      },
    },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

}