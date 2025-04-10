return {
  "nvim-lua/plenary.nvim",
  {
    "nvchad/ui",
    event = "VeryLazy",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/volt", -- optional, needed for theme switcher
    keys = {
      {
        "<leader>th",
        function()
          require("nvchad.themes").open()
        end,
        desc = "select nvchad themes",
        mode = { "n" },
      },
    },
  },
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },
}
