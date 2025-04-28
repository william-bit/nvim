return {
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
      local lint = require "lint"
      -- PHPCS Config
      local phpcs = lint.linters.phpcs
      phpcs.args = {
        "-q",
        "--standard=PSR12",
        "--report=json",
        "-",
      }

      -- Cspell Configaa
      local cspell = lint.linters.cspell
      cspell.args = {
        "lint",
        "--no-color",
        "--no-progress",
        "--no-summary",
        "--config",
        "C:\\Users\\dartmedia\\AppData\\Local\\nvim\\cspell\\settings.jsonc",
      }

      lint.linters_by_ft = {
        php = { "phpcs" },
        json = { "jsonlint" },
        python = { "ruff" },
        docker = { "hadolint" },
        bash = { "shellcheck" },
        sql = { "sqlfluff" },
        text = { "vale" },
        laTeX = { "vale" },
      }

      vim.api.nvim_create_user_command("CspellConfig", function()
        vim.cmd.edit [[~\\AppData\\Local\\nvim\\cspell\\settings.jsonc]]
      end, { nargs = 0, desc = "edit cspell config" })

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          lint.try_lint()
          lint.try_lint "cspell"
        end,
      })
    end,
  },
}
