return {
  { "vim-scripts/dbext.vim", ft = { "sql" } },
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format {
            timeout_ms = 10000,
          }
        end,
        desc = "Format File",
      },
    },
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      require("nvim-treesitter.install").compilers = { "zig" }
      dofile(vim.g.base46_cache .. "treesitter")
      return require "configs.treesitter"
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade.filetype = "blade"
      parser_config.blade.install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      }
      -- Filetypes --
      vim.filetype.add {
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      }
    end,
  },
}
