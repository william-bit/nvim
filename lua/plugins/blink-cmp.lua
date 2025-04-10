return {
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
}
