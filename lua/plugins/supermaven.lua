return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_word = "<C-l>",
        },
      })
    end,
    enabled = false,
  },
}
