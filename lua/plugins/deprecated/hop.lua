return {
  {
    "smoka7/hop.nvim",
    version = "*",
    enabled = false,
    opts = function()
      require("hop").setup()
      local map = vim.keymap
      map.set("n", "s", "<cmd>HopChar1<CR>")
      map.set("n", "sj", "<cmd>HopLine<CR>")
      map.set("n", "sk", "<cmd>HopWord<CR>")
      map.set("n", "sl", "<cmd>HopAnywhereCurrentLineAC<CR>")
      map.set("n", "sh", "<cmd>HopAnywhereCurrentLineBC<CR>")
    end,
  },
}
