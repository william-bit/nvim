return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saghen/blink.compat",
      { "L3MON4D3/LuaSnip", version = "v2.*" },
    },
    -- use a release tag to download pre-built binaries
    config = {
      snippets = { preset = "luasnip" },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            async = true,
          },
          supermaven = {
            name = "supermaven",
            module = "blink.compat.source",
            score_offset = 100,
            async = true,
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
          auto_show = function(ctx)
            if ctx.mode == "cmdline" then
              return false
            end
            if vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype()) then
              return false
            end
            return true
          end,
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
