return {
  {
    "Exafunction/windsurf.nvim",
    enabled = false,
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("codeium").setup {}
    end,
  },
}
