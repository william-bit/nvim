local function first(bufnr, ...)
  local conform = require("conform")
  for i = 1, select("#", ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

return {
  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters = {
          php_cs_fixer = {
            append_args = { "--config", "c:/laragon/config/PhpCsFixer/.php-cs-fixer.php" },
          },
        },
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          markdown = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "rustywind" },
          typescriptreact = { "rustywind" },
          vue = { "rustywind" },
          blade = { "rustywind" },
          php = { "rustywind", "php_cs_fixer" },
          html = function(bufnr)
            return { "rustywind", first(bufnr, "prettierd", "prettier") }
          end,
        },
      }
      return opts
    end,
  },
}
