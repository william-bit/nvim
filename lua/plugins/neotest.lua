return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "william-bit/neotest-playwright",
      dependencies = "nvim-telescope/telescope.nvim",
    },
    opts = function()
      return {
        adapters = {
          ["neotest-playwright"] = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        },
        consumers = {
          -- add to your list of consumers
          playwright = require("neotest-playwright.consumers").consumers,
        },
      }
    end,
  },
  {
    "william-bit/neotest-playwright",
    keys = {
      {
        "<leader>ta",
        function()
          require("neotest").playwright.attachment()
        end,
        desc = "Launch test attachment",
      },
    },
  },
}
