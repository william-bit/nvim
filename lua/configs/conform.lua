local function first(bufnr, ...)
  local conform = require "conform"
  for i = 1, select("#", ...) do
    local formatter = select(i, ...)
    if conform.get_formatter_info(formatter, bufnr).available then
      return formatter
    end
  end
  return select(1, ...)
end

local options = {
  formatters = {
    php_cs_fixer = {
      append_args = { "--config", "c:/laragon/config/PhpCsFixer/.php-cs-fixer.php" },
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    xml = { "xmlformatter" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    markdown = { "prettierd", stop_after_first = true },
    java = { "google-java-format" },
    javascript = { "prettierd", stop_after_first = true },
    typescript = { "prettierd", stop_after_first = true },
    javascriptreact = { "prettierd", "rustywind" },
    typescriptreact = { "prettierd", "rustywind" },
    vue = { "prettierd", "rustywind" },
    blade = { "rustywind" },
    php = { "rustywind", "php_cs_fixer" },
    html = function(bufnr)
      return { "rustywind", first(bufnr, "prettierd", "prettier") }
    end,
  },
}

return options
