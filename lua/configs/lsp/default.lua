local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  -- global lsp mappings
  map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
  map("n", ",", function()
    vim.lsp.buf.hover()
  end, opts "Show variable info")
  map("n", "?", function()
    vim.diagnostic.open_float()
  end, { desc = "Show Error info" })
  map("n", "gs", function()
    vim.lsp.buf.rename()
  end, { desc = "Rename LSP" })
end

M.on_init = function(client, _)
  client.server_capabilities.semanticTokensProvider = true
end

-- require('blink.cmp').get_lsp_capabilities()
-- require("cmp_nvim_lsp").default_capabilities()
-- vim.lsp.protocol.make_client_capabilities()
M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.diagnostic_config = function()
  local x = vim.diagnostic.severity

  vim.diagnostic.config {
    virtual_text = { prefix = "" },
    signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
    underline = true,
    float = { border = "single" },
  }
end

M.debug = function()
  vim.lsp.set_log_level "debug"
  require("vim.lsp.log").set_format_func(vim.inspect)
end

M.defaults = function()
  M.diagnostic_config()

  vim.lsp.config("*", {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,
  })
end

return M
