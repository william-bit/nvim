return {
  {
    "mfussenegger/nvim-lint",
    opts = function()
      -- PHPCS Config
      local phpcs = require("lint").linters.phpcs
      phpcs.args = {
        "-q",
        "--standard=PSR12",
        "--report=json",
        "-",
      }

      -- Cspell Config
      local cspell = require("lint").linters.cspell
      cspell.args = {
        "lint",
        "--no-color",
        "--no-progress",
        "--no-summary",
        "--config",
        "C:\\Users\\dartmedia\\AppData\\Local\\nvim\\cspell\\settings.jsonc",
      }

      vim.api.nvim_create_user_command("CspellConfig", function()
        vim.cmd.edit([[~\\AppData\\Local\\nvim\\cspell\\settings.jsonc]])
      end, { nargs = 0, desc = "edit cspell config" })

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint("cspell")
          require("lint").linters_by_ft = {
            php = { "phpcs" },
          }
        end,
      })
    end,
  },
}
