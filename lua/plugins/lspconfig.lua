-- Enable diagnostic
vim.diagnostic.config({
  virtual_text = true,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 500

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      if LazyVim.pick.want() ~= "telescope" then
        return
      end
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      Keys[#Keys + 1] = { "gr", false }
      Keys[#Keys + 1] = { "<a-n>", false }
      vim.list_extend(Keys, {
        {
          "gd",
          function()
            require("telescope.builtin").lsp_definitions({ reuse_win = true })
          end,
          desc = "Goto Definition",
          has = "definition",
        },
        { "gj", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true },
        {
          "gi",
          function()
            require("telescope.builtin").lsp_implementations({ reuse_win = true })
          end,
          desc = "Goto Implementation",
        },
        {
          "gt",
          function()
            require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
          end,
          desc = "Goto T[y]pe Definition",
        },
      })
    end,
  },
}
