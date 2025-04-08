return { -- lazy.nvim
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
}
