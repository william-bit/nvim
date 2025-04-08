return {
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "BufReadPost",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "gl", "<Plug>ReplaceWithRegisterOperator" },
      { "glr", "<Plug>ReplaceWithRegisterLine" },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "typescript",
      "vue",
      "astro",
      "glimmer",
      "handlebars",
      "javascriptreact",
      "typescriptreact",
      "markdown",
      "php",
      "blade",
      "rescript",
      "svelte",
      "twig",
    },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
    },
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<A-o>", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    config = true,
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
  },
}
