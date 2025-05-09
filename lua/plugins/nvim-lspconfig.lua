return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "User FilePost",
    opts = {
      automatic_enable = {
        exclude = {
          "jdtls",
        },
      },
    },
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
      },
    },
  },
}
