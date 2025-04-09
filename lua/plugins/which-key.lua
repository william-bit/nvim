return {
  {
    "folke/which-key.nvim",
    event = "BufRead",
    keys = {
      "<leader>",
      "<c-w>",
      '"',
      "'",
      "`",
      "c",
      "v",
      "g",
      -- Which-key as fix spell check
      {
        "<c-l>",
        function()
          require("which-key").show("z=", { mode = "n", auto = true })
        end,
        desc = "whichkey fix spell check",
        mode = { "n" },
      },
      { "<leader>wK", "<cmd>WhichKey <CR>", mode = { "n" }, desc = "whichkey all keymaps" },
      {
        "<leader>wk",
        function()
          vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
        end,
        desc = "whichkey query lookup",
        mode = { "n" },
      },
    },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },
}
