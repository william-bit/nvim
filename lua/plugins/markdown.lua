return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function()
      require("render-markdown").setup({
        pipe_table = {
          -- Turn on / off pipe table rendering
          enabled = false,
        },
        heading = {
          icons = { "#1 ", "#2 ", "#3 ", "#4 ", "#5 ", "#6 " },
          signs = { "󰫎 " },
          above = "▄",
          below = "▀",
        },
      })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
