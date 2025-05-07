return {
  -- Ensure java debugger and test packages are installed.
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dd", "<cmd>lua require('dap').toggle_breakpoint()<cr>" },
      { "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>" },
      { "<leader>dc", "<cmd>lua require('dap').continue()<cr>" },
      { "<leader>db", "<cmd>lua require('dap').step_back()<cr>" },
      { "<leader>dn", "<cmd>lua require('dap').step_over()<cr>" },
      { "<leader>ds", "<cmd>lua require('dap').step_into()<cr>" },
      { "<leader>du", "<cmd>lua require('dap').step_out()<cr>" },
      { "<leader>dl", "<cmd>lua require('dap').run_last()<cr>" },
      { "<leader>dt", "<cmd>lua require('dap').terminate()<cr>" },
      { "<leader>dp", "<cmd>lua require('dap').pause.toggle()<cr>" },
      { "<leader>dv", "<cmd>lua require('dap').variables()<cr>" },
      { "<leader>do", "<cmd>lua require('dap').open()<cr>" },
    },
    config = function()
      -- Simple configuration to attach to remote java debug process
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Symbols displayed in the gutter
      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "•", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "•", texthl = "DapBreakpointCondition", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "•", texthl = "DapBreakpointRejected", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapStopped",
        { text = "•", texthl = "DapStopped", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapLogPoint",
        { text = "•", texthl = "DapLogPoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
      )

      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local mason_registry = require "mason-registry"
      if mason_registry.is_installed "php-debug-adapter" then
        local php_dbg_path = vim.fn.stdpath "data" .. "\\mason\\packages\\php-debug-adapter"
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { php_dbg_path .. "/extension/out/phpDebug.js" },
        }
        dap.configurations.php = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
          },
        }
      end

      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
    dependencies = {
      {
        "ibhagwan/fzf-lua",
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
}
