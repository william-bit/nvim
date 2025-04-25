return {
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = { "java" },
    config = function()
      local jdtls = require "jdtls"
      local javalsp = require "configs.lsp.java"

      local initOncePerBuffer = {}
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java" },
        callback = function(data)
          local bufnr = data.buf
          if not initOncePerBuffer[bufnr] then
            initOncePerBuffer[bufnr] = true
            jdtls.start_or_attach(javalsp.config())
            vim.notify "Attached jdtls to java buffer"
          end
        end,
      })
    end,
  },
}
