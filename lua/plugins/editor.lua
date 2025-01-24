return {
  { "vim-scripts/ReplaceWithRegister", event = "BufRead" },
  { "tpope/vim-repeat", event = "BufRead" },
  { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead *.ts,*.tsx" },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
