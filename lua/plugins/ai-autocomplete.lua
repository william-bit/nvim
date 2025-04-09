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
}
