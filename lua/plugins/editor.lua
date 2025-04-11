return {
  {
    "folke/ts-comments.nvim",
    config = true,
    event = "BufReadPost",
  },
  {
    "vim-scripts/ReplaceWithRegister",
    keys = {
      { "gl", "<Plug>ReplaceWithRegisterOperator", desc = "ReplaceWithRegister Operator" },
      { "glr", "<Plug>ReplaceWithRegisterLine", desc = "ReplaceWithRegister Line" },
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
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    config = true,
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
  },
}
