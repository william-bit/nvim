return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
      })
    end,
    cmd = "ToggleTerm",
    opts = function()
      return {
        shade_filetypes = {},
        hide_numbers = true,
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = true,
        close_on_exit = true,
      }
    end,
  },
}
