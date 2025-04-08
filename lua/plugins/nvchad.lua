return {
  "nvim-lua/plenary.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return {
        override = {
          default_icon = { icon = "󰈚", name = "Default" },
          js = { icon = "󰌞", name = "js" },
          ts = { icon = "󰛦", name = "ts" },
          lock = { icon = "󰌾", name = "lock" },
          ["robots.txt"] = { icon = "󰚩", name = "robots" },
        },
      }
    end,
  },
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
