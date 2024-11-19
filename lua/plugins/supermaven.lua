return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_word = "<C-l>",
        },
        ignore_filetypes = {
          "snacks_dashboard",
          "TelescopePrompt",
          "neo-tree",
        },
      })
    end,
    enabled = false,
  },
}
