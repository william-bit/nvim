return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "thenbe/neotest-playwright",
      dependencies = "nvim-telescope/telescope.nvim",
    },
    opts = {
      adapters = {
        ["neotest-playwright"] = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      },
    },
  },
}
