local M = {}
M.env = {
  HOME = vim.uv.os_homedir(),
  XDG_CACHE_HOME = os.getenv "XDG_CACHE_HOME",
  JDTLS_JVM_ARGS = os.getenv "JDTLS_JVM_ARGS",
  JDTLS_EXT_DIR = "C:\\Users\\dartmedia\\AppData\\Local\\nvim-data\\java\\",
}

M.lombok_jar = M.env.JDTLS_EXT_DIR .. "\\lombok.jar"

M.opts = {
  dap_main = {},
  test = true,
  dap = { hotcodereplace = "auto", config_overrides = {} },
}

M.on_attach = function(client, bufnr)
  require("configs.lsp").on_attach(client, bufnr)
  if client and client.name == "jdtls" then
    local wk = require "which-key"
    wk.add {
      {
        mode = "n",
        buffer = bufnr,
        { "<leader>cx", group = "extract" },
        { "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
        { "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
        { "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
        { "<leader>coi", require("jdtls").organize_imports, desc = "Organize Imports" },
        { "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
        { "<leader>cr", [[<ESC><CMD>JdtRestart<CR>]], desc = "JdtRestart" },
      },
    }
    wk.add {
      {
        mode = "v",
        buffer = bufnr,
        { "<leader>cx", group = "extract" },
        {
          "<leader>cxm",
          [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
          desc = "Extract Method",
        },
        {
          "<leader>cxv",
          [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
          desc = "Extract Variable",
        },
        {
          "<leader>cxc",
          [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
          desc = "Extract Constant",
        },
      },
    }

    -- custom init for Java debugger
    require("jdtls").setup_dap(M.opts.dap)
    if M.opts.dap_main then
      require("jdtls.dap").setup_dap_main_class_configs(M.opts.dap_main)
    end

    -- Java Test require Java debugger to work
    -- custom keymaps for Java test runner (not yet compatible with neotest)
    wk.add {
      {
        mode = "n",
        buffer = bufnr,
        { "<leader>t", group = "test" },
        {
          "<leader>tt",
          function()
            require("jdtls.dap").test_class {
              config_overrides = type(M.opts.dap) ~= "boolean" and M.opts.dap.config_overrides or nil,
            }
          end,
          desc = "Run All Test",
        },
        {
          "<leader>tr",
          function()
            require("jdtls.dap").test_nearest_method {
              config_overrides = type(M.opts.dap) ~= "boolean" and M.opts.dap.config_overrides or nil,
            }
          end,
          desc = "Run Nearest Test",
        },
        { "<leader>tT", require("jdtls.dap").pick_test, desc = "Run Test" },
      },
    }
  end
end

M.equinox_jar = function()
  -- INFO: It's annoying to edit the version again and again.
  local equinox_path = vim.split(vim.fn.glob(M.env.JDTLS_EXT_DIR .. "jdtls\\plugins\\*jar"), "\n")
  local equinox_launcher = ""

  for _, file in pairs(equinox_path) do
    if file:match "org.eclipse.equinox.launcher_" then
      equinox_launcher = file
      break
    end
  end
  return equinox_launcher
end

M.jar_patterns = {}

M.test = function()
  -- java-test also depends on java-debug-adapter.
  local java_test_path = M.env.JDTLS_EXT_DIR .. "java-test/server/*.jar"
  vim.list_extend(M.jar_patterns, { java_test_path })
end

M.debug = function()
  local java_dbg_path = M.env.JDTLS_EXT_DIR .. "java-debug/extension/server/*.jar"
  vim.list_extend(M.jar_patterns, { java_dbg_path })
end
M.bundles = function()
  M.test()
  M.debug()
  local bundles = {} ---@type string[]
  if M.jar_patterns == {} then
    return {}
  end
  local notify = vim.notify "Searching for jar bundles..."
  for _, jar_pattern in ipairs(M.jar_patterns) do
    for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
      -- notify loading bundles but only filename not full path
      notify = vim.notify("Loading jar : " .. vim.fn.fnamemodify(bundle, ":t"), "info", { replace = notify })
      table.insert(bundles, bundle)
    end
  end
  notify = vim.notify("Finish load jar bundles", "info", { replace = notify })
  return bundles
end

M.fname = vim.api.nvim_buf_get_name(0)
-- How to find the project name for a given root dir.
M.project_name = function()
  local root_dir = M.root_dir
  return vim.fs.basename(root_dir)
end

-- Where are the config and workspace dirs for a project?
M.jdtls_config_dir = function()
  return M.env.JDTLS_EXT_DIR .. "jdtls\\config_win"
end
M.jdtls_workspace_dir = function()
  return M.get_jdtls_cache_dir() .. "\\workspace"
end

M.get_cache_dir = function()
  return M.env.XDG_CACHE_HOME and M.env.XDG_CACHE_HOME or M.env.HOME .. "\\.cache"
end

M.get_jdtls_cache_dir = function()
  return M.get_cache_dir() .. "\\jdtls"
end

M.root_dir = require("lspconfig.configs.jdtls").default_config.root_dir(M.fname)
M.handler = require("lspconfig.configs.jdtls").default_config.handlers
M.init_options = {
  extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
  bundles = M.bundles(),
}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M
