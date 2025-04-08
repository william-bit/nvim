return {
  "nvim-lua/plenary.nvim",
  {
    "nvchad/ui",
    event = "VeryLazy",
    keys = {
      { "<leader>ch", "<cmd>NvCheatsheet<CR>", mode = { "n" }, desc = "toggle nvcheatsheet" },
      {
        "<leader>th",
        function()
          require("nvchad.themes").open()
        end,
        desc = "select nvchad themes",
        mode = { "n" },
      },
    },
    config = function()
      require "nvchad"
    end,
    opts = function()
      require "configs.style"
    end
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/volt", -- optional, needed for theme switcher
    event = "VeryLazy",
  },
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },
}
