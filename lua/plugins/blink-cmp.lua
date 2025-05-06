return {
  {
    "saghen/blink.cmp",
    version = "*",
    event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saghen/blink.compat",
    },
    -- use a release tag to download pre-built binaries
    opts = function()
      dofile(vim.g.base46_cache .. "blink")
      local conf = {
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
        signature = { enabled = false },
        completion = {
          ghost_text = { enabled = false },
          accept = {
            auto_brackets = {
              enabled = false,
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          },
          menu = require("nvchad.blink").menu,
        },
      }
      return conf
    end,
  },
}
