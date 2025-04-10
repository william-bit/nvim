return {
  {
    "Exafunction/windsurf.nvim",
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
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },
    -- use a release tag to download pre-built binaries
    config = {
      snippets = { preset = "luasnip" },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { "supermaven", "codeium", "lsp", "path", "snippets", "buffer" ,"omni"},
        providers = {
          lsp = {
            async = true,
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
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    config = true,
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<c-o>", "<cmd>FzfLua buffers<CR>" },
      { "<c-f>", "<cmd>FzfLua live_grep<CR>" },
      { "<c-p>", "<cmd>FzfLua files<CR>" },
      { "<c-t>", "<cmd>FzfLua git_status<CR>" },
      { "<c-x>", "<cmd>FzfLua oldfiles<CR>" },
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

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format { lsp_fallback = true }
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
  -- Set up nvim-jdtls to attach to java files.
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "folke/which-key.nvim",
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "jdtls" } },
      },
    },
    -- This is the same as in lspconfig.configs.jdtls, but avoids
    -- needing to require that when this module loads.
    ft = { "java" },
    opts = function()
      local cmd = { vim.fn.exepath "jdtls" }
      local mason_registry = require "mason-registry"
      local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
      local equinox_jar = function()
        -- INFO: It's annoying to edit the version again and again.
        local equinox_path =
          vim.split(vim.fn.glob(mason_registry.get_package("jdtls"):get_install_path() .. "/plugins/*jar"), "\n")
        local equinox_launcher = ""

        for _, file in pairs(equinox_path) do
          if file:match "org.eclipse.equinox.launcher_" then
            equinox_launcher = file
            break
          end
        end
        return equinox_launcher
      end
      table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      return {
        -- How to find the root dir for a given filename. The default comes from
        -- lspconfig which provides a function specifically for java projects.
        root_dir = require("lspconfig.configs.jdtls").default_config.root_dir,

        -- How to find the project name for a given root dir.
        project_name = function(root_dir)
          return root_dir and vim.fs.basename(root_dir)
        end,

        -- Where are the config and workspace dirs for a project?
        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/config"
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/workspace"
        end,

        -- How to run jdtls. This can be overridden to a full java command-line
        -- if the Python wrapper script doesn't suffice.
        cmd = cmd,
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local fullCmd = vim.deepcopy(opts.cmd)
          if project_name then
            vim.list_extend(fullCmd, {
              "-Declipse.application=org.eclipse.jdt.ls.core.id1",
              "-Dosgi.bundles.defaultStartLevel=4",
              "-Declipse.product=org.eclipse.jdt.ls.core.product",
              "-Dlog.protocol=true",
              "-Dlog.level=ALL",
              "-Xms512m",
              "-Xmx2G",
              "-Xss2m",
              "--add-modules=ALL-SYSTEM",
              "--add-opens",
              "java.base/java.util=ALL-UNNAMED",
              "--add-opens",
              "java.base/java.lang=ALL-UNNAMED",
              "-jar",
              equinox_jar(),
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
            })
          end
          return fullCmd
        end,

        -- These depend on nvim-dap, but can additionally be disabled by setting false here.
        dap = { hotcodereplace = "auto", config_overrides = {} },
        -- Can set this to false to disable main class scan, which is a performance killer for large project
        dap_main = {},
        test = true,
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
    end,
    config = function(_, opts)
      -- Find the extra bundles that should be passed on the jdtls command-line
      -- if nvim-dap is enabled with java debug/test.
      local bundles = {} ---@type string[]
      local mason_registry = require "mason-registry"
      if opts.dap and mason_registry.is_installed "java-debug-adapter" then
        local java_dbg_pkg = mason_registry.get_package "java-debug-adapter"
        local java_dbg_path = java_dbg_pkg:get_install_path()
        local jar_patterns = {
          java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
        }
        -- java-test also depends on java-debug-adapter.
        if opts.test and mason_registry.is_installed "java-test" then
          local java_test_pkg = mason_registry.get_package "java-test"
          local java_test_path = java_test_pkg:get_install_path()
          vim.list_extend(jar_patterns, {
            java_test_path .. "/extension/server/*.jar",
          })
        end
        for _, jar_pattern in ipairs(jar_patterns) do
          for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
            table.insert(bundles, bundle)
          end
        end
      end
      local function attach_jdtls()
        local fname = vim.api.nvim_buf_get_name(0)

        -- Utility function to extend or override a config table, similar to the way
        -- that Plugin.opts works.
        ---@param config table
        ---@param custom function | table | nil
        local function extend_or_override(config, custom, ...)
          if type(custom) == "function" then
            config = custom(config, ...) or config
          elseif custom then
            config = vim.tbl_deep_extend("force", config, custom) --[[@as table]]
          end
          return config
        end

        -- Configuration can be augmented and overridden by opts.jdtls
        local config = extend_or_override({
          cmd = opts.full_cmd(opts),
          root_dir = opts.root_dir(fname),
          init_options = {
            bundles = bundles,
          },
          settings = opts.settings,

          -- enable CMP capabilities
          capabilities = require("configs.lsp").capabilities,
          on_attach = require("configs.lsp").on_attach,
          on_init = require("configs.lsp").on_init,
        }, opts.jdtls)

        -- Existing server will be reused if the root_dir matches.
        require("jdtls").start_or_attach(config)
        -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
      end

      -- Attach the jdtls for each java buffer. HOWEVER, this plugin loads
      -- depending on filetype, so this autocmd doesn't run for the first file.
      -- For that, we call directly below.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = attach_jdtls,
      })

      -- Setup keymap and dap after the lsp is fully attached.
      -- https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
      -- https://neovim.io/doc/user/lsp.html#LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            local wk = require "which-key"
            wk.add {
              {
                mode = "n",
                buffer = args.buf,
                { "<leader>cx", group = "extract" },
                { "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
                { "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
                { "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
                { "<leader>coi", require("jdtls").organize_imports, desc = "Organize Imports" },
                { "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
              },
            }
            wk.add {
              {
                mode = "v",
                buffer = args.buf,
                { "<leader>cx", group = "extract" },
                {
                  "<leader>cxm",
                  [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
                  desc = "Extract Method",
                },
                {
                  "<leader>cxv",
                  [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
                  desc = "Extract Variable",
                },
                {
                  "<leader>cxc",
                  [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
                  desc = "Extract Constant",
                },
              },
            }

            if opts.dap and mason_registry.is_installed "java-debug-adapter" then
              -- custom init for Java debugger
              require("jdtls").setup_dap(opts.dap)
              if opts.dap_main then
                require("jdtls.dap").setup_dap_main_class_configs(opts.dap_main)
              end

              -- Java Test require Java debugger to work
              if opts.test and mason_registry.is_installed "java-test" then
                -- custom keymaps for Java test runner (not yet compatible with neotest)
                wk.add {
                  {
                    mode = "n",
                    buffer = args.buf,
                    { "<leader>t", group = "test" },
                    {
                      "<leader>tt",
                      function()
                        require("jdtls.dap").test_class {
                          config_overrides = type(opts.test) ~= "boolean" and opts.test.config_overrides or nil,
                        }
                      end,
                      desc = "Run All Test",
                    },
                    {
                      "<leader>tr",
                      function()
                        require("jdtls.dap").test_nearest_method {
                          config_overrides = type(opts.test) ~= "boolean" and opts.test.config_overrides or nil,
                        }
                      end,
                      desc = "Run Nearest Test",
                    },
                    { "<leader>tT", require("jdtls.dap").pick_test, desc = "Run Test" },
                  },
                }
              end
            end

            -- User can set additional keymaps in opts.on_attach
            if opts.on_attach then
              opts.on_attach(args)
            end
          end
        end,
      })
      -- Avoid race condition by calling attach the first time, since the autocmd won't fire.
      attach_jdtls()
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
          vim.api.nvim_create_autocmd({ "CursorMoved", "TextChangedI" }, {
            callback = function()
              require("notify").dismiss()
            end,
          })

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