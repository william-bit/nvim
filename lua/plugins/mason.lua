return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      dofile(vim.g.base46_cache .. "mason")
      return {
        PATH = "skip",

        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },

        max_concurrent_installers = 10,
      }
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      automatic_enable = {
        exclude = {
          "jdtls",
          "gradle_ls",
          "lua_ls"
        },
      },
    },
  },
}
