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
      return {
        lsp = {
          signature = {
            enabled = true,
          },
        },
      }
    end,
  },
}
