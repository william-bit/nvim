return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = function()
          -- Remove notification when cursor changed and new text added
          vim.api.nvim_create_autocmd({ "CursorMoved", "TextChangedI" }, {
            callback = function()
              require("notify").dismiss()
            end,
          })
          return {
            render = "compact",
            stages = "static",
          }
        end,
      },
    },
    opts = function()
      dofile(vim.g.base46_cache .. "lsp")
      dofile(vim.g.base46_cache .. "syntax")
      return {
        health = {
          checker = false, -- Disable if you don't want health checks to run
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
          },
          signature = {
            enabled = true,
          },
        },
      }
    end,
  },
}
