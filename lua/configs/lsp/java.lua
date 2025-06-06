-- Some references setting from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/java.lua
---@class JavaConfig -- Convert from https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
---@field autobuild EnabledOption?
---@field cleanup CleanUpOption?
---@field codeGeneration CodeGenerationOption?
---@field codeAction CodeActionOption?
---@field completion CompletionOptions?
---@field configuration ConfigurationOptions?
---@field contentProvider ContentProvider?
---@field eclipse EclipseOptions?
---@field errors ErrorsOptions?
---@field executeCommand EnabledOption?
---@field foldingRange EnabledOption?
---@field progressReports EnabledOption
---@field format FormatOption?
---@field home string?
---@field implementationsCodeLens EnabledOption?
---@field import ImportOption?
---@field inlayhints InlayHints?
---@field jdt JDTOptions?
---@field maven MavenOptions?
---@field maxConcurrentBuilds number?
---@field memberSortOrder string?
---@field project ProjectOptions?
---@field quickfix QuickFixOption?
---@field referencesCodeLens EnabledOption?
---@field references ReferencesOption?
---@field rename EnabledOption?
---@field saveActions SaveActions?
---@field selectionRange EnabledOption?
---@field settings SettingsOption?
---@field signatureHelp SignatureHelpOption?
---@field sources SourcesOption?
---@field symbols SymbolsOption?
---@field templates TemplatesOption?
---@field trace TraceOptions?
---@field edit EditOption?

---@class EnabledOption
---@field enabled boolean

---@class CleanUpOption
---@field actionsOnSave CleanUpOnSaveActions?
---@alias CleanUpOnSaveActions 'qualifyMembers'| 'qualifyStaticMembers'| 'addOverride'| 'addDeprecated'| 'stringConcatToTextBlock'| 'invertEquals'| 'addFinalModifier'| 'instanceofPatternMatch'| 'lambdaExpression'| 'switchExpression'

---@class CodeGenerationOption
---@field generateComments boolean?
---@field hashCodeEquals HashCodeOption?
---@field insertionLocation string?
---@field toString ToStringOption?
---@field useBlocks boolean?

---@class HashCodeOption
---@field useInstanceof boolean?
---@field useJava7Objects boolean?

---@class ToStringOption
---@field codeStyle string?
---@field limitElements number?
---@field listArrayContents boolean?
---@field skipNullValues boolean?
---@field template string?

---@class CodeActionOption
---@field sortMembers SortMembersOption

---@class SortMembersOption
---@field avoidVolatileChanges boolean?

---@class ContentProvider
---@field preferred string

---@class EclipseOptions
---@field downloadSources boolean

---@class ErrorsOptions
---@field incompleteClasspath IncompleteClasspath

---@class IncompleteClasspath
---@field severity  'ignore'| 'info'| 'warning'| 'error'

---@class FormatOption
---@field comments EnabledOption?
---@field enabled boolean?
---@field insertSpaces boolean?
---@field onType EnabledOption?
---@field settings FormatSettingsOption?
---@field tabSize number?

---@class FormatSettingsOption
---@field profile string?
---@field url string?

---@class InlayHints
---@field parameterNames ParameterNamesOption

---@class ParameterNamesOption {
---@field enabled 'none'| 'literals'| 'all'
---@field exclusions string[]?

---@class ImportOption
---@field exclusions string[]
---@field gradle GradleOption?
---@field maven MavenImportOption?

---@class MavenImportOption
---@field enabled boolean?
---@field offline EnabledOption?

---@class GradleOption
---@field annotationProcessing EnabledOption?
---@field arguments string[]?
---@field enabled boolean?
---@field home string?
---@field java HomeOption?
---@field jvmArguments string[]?
---@field offline EnabledOption?
---@field user HomeOption?
---@field version string?
---@field wrapper GradleWrapperOption?

---@class GradleWrapperOption
---@field enabled boolean?
---@field checksums string[]?

---@class HomeOption
---@field home string

---@class JDTOptions
---@field ls JDTLSOptions?

---@class JDTLSOptions
---@field androidSupport EnabledOption?
---@field lombokSupport EnabledOption?
---@field protofBufSupport EnabledOption?

---@class MavenOptions
---@field downloadSources boolean?
---@field updateSnapshots boolean?

---@class ProjectOptions
---@field encoding  'IGNORE'| 'WARNING'| 'SETDEFAULT'?
---@field outputPath string?
---@field referencedLibraries string[] | ReferencedLibrariesOption?
---@field resourceFilters string []?
---@field sourcePaths string []?

---@class ReferencedLibrariesOption
---@field exclude string[]?
---@field include string[]
---@field sources SourceOption[]?

---@class SourceOption
---@field library string
---@field source string

---@class QuickFixOption
---@field showAt string

---@class ReferencesOption
---@field includeAccessors boolean?
---@field includeDecompiledSources boolean?

---@class SaveActions
---@field organizeImports boolean

---@class SettingsOption
---@field url string?

---@class SignatureHelpOption
---@field enabled boolean
---@field description EnabledOption?

---@class SourcesOption
---@field organizeImports OrganizeImportsOption;

---@class OrganizeImportsOption
---@field starThreshold number?
---@field staticStarThreshold number?

---@class SymbolsOption
---@field includeSourceMethodDeclarations boolean?

---@class TemplatesOption
---@field fileHeader string[]?
---@field typeComment string[]?

---@class TraceOptions
---@field server 'off'| 'messages'| 'verbose'

---@class EditOption
---@field validateAllOpenBuffersOnChanges boolean?

---@class CompletionOptions
---@field enabled boolean?
---@field favoriteStaticMembers string[]?
---@field filteredTypes string[]?
---@field guessMethodArguments boolean?
---@field importOrder string[]?
---@field matchCase "OFF"|"FIRSTLETTER"?
---@field maxResults number?
---@field overwrite boolean?
---@field postfix EnabledOption?

---@class ConfigurationOptions
---@field updateBuildConfiguration 'disabled'| 'automatic'|'interactive'?
---@field maven MavenOptions?
---@field runtimes RuntimeOption[]?

---@class RuntimeOption
---@field name ExecutionEnvironment
---@field path string
---@field javadoc string?
---@field sources string?
---@field default boolean?
---@alias ExecutionEnvironment 'J2SE-1.5'| 'JavaSE-1.6'| 'JavaSE-1.7'| 'JavaSE-1.8'| 'JavaSE-9'| 'JavaSE-10'| 'JavaSE-11'| 'JavaSE-12'| 'JavaSE-13'| 'JavaSE-14'| 'JavaSE-15'| 'JavaSE-16'| 'JavaSE-17'| 'JavaSE-18'| 'JavaSE-19'| 'JavaSE-20'| 'JavaSE-21'| 'JavaSE-22'

-- Current lsp directory structure for these configs
-- ../nvim-data
--    └── lsp
--        ├── jdtls
--        ├── java-debug
--        └── java-test

local M = {}
M.env = {
  --- @type RuntimeOption[]
  runtimes = {
    {
      name = "JavaSE-21",
      path = "C:\\Program Files\\Eclipse Adoptium\\jdk-21.0.7.6-hotspot",
    },
  },
  dap_main = {},
  test = true,
  dap = { hotcodereplace = "auto", config_overrides = {} },

  JDTLS_EXT_DIR = vim.fn.stdpath "data" .. "\\lsp\\java\\",
  JDTLS_FOLDER_NAME = "jdtls-1.47.0",

  --- @type "config_win" | "config_linux" | "config_mac"
  JDTLS_CONFIG_OS_FOLDER_NAME = "config_win",

  JAVA_TEST_FOLDER_NAME = "java-test",

  JAVA_DEBUG_FOLDER_NAME = "java-debug",

  -- I don't know why but this module always show warning in lsp.log : "WARNING: Using incubator modules: jdk.incubator.vector"
  EXClUDE_JAVA_MODULES = { "jdk.incubator.vector" },

  -- I don't know why but this jars always show error in lsp.log when include in bundles
  EXCLUDE_JDTLS_JAR_BUNDLES = { "com.microsoft.java.test.runner-jar-with-dependencies.jar", "jacocoagent.jar" },

  -- It duplicate with jars bundle already included in jdtls by default
  DUPLICATE_JAR_BUNDLES = {
    -- "junit-platform-commons_1.11.0.jar",
    -- "junit-platform-engine_1.11.0.jar",
    -- "junit-platform-launcher_1.11.0.jar",
    -- "org.apiguardian.api_1.1.2.jar",
    -- "org.opentest4j_1.3.0.jar",
  },
}

M.java_test_path = M.env.JDTLS_EXT_DIR .. M.env.JAVA_TEST_FOLDER_NAME .. "/server/*.jar"
M.java_debug_path = M.env.JDTLS_EXT_DIR .. M.env.JAVA_DEBUG_FOLDER_NAME .. "/extension/server/*.jar"
M.lombok_jar = M.env.JDTLS_EXT_DIR .. "lombok.jar"
M.equinox_path = vim.split(vim.fn.glob(M.env.JDTLS_EXT_DIR .. M.env.JDTLS_FOLDER_NAME .. "\\plugins\\*jar"), "\n")

M.mapper = function(mode, bufnr, maps)
  for _, map in pairs(maps) do
    vim.keymap.set(mode, map[1], map[2], { buffer = bufnr, desc = map.desc, group = map.group })
  end
end

M.on_attach = function(client, bufnr)
  require("configs.lsp.default").on_attach(client, bufnr)
  if client and client.name == "jdtls" then
    M.mapper("n", bufnr, {
      { "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
      { "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
      { "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
      { "<leader>coi", require("jdtls").organize_imports, desc = "Organize Imports" },
      { "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
      { "<leader>cr", [[<ESC><CMD>JdtRestart<CR>]], desc = "JdtRestart" },
    })
    M.mapper("v", bufnr, {
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
    })
    -- custom init for Java debugger
    require("jdtls").setup_dap(M.env.dap)
    if M.env.dap_main then
      require("jdtls.dap").setup_dap_main_class_configs(M.env.dap_main)
    end

    -- Java Test require Java debugger to work
    -- custom keymaps for Java test runner (not yet compatible with neotest)
    M.mapper("n", bufnr, {
      {
        "<leader>tt",
        function()
          require("jdtls.dap").test_class {
            config_overrides = type(M.env.dap) ~= "boolean" and M.env.dap.config_overrides or nil,
          }
        end,
        desc = "Run All Test",
      },
      {
        "<leader>tr",
        function()
          require("jdtls.dap").test_nearest_method {
            config_overrides = type(M.env.dap) ~= "boolean" and M.env.dap.config_overrides or nil,
          }
        end,
        desc = "Run Nearest Test",
      },
      { "<leader>tT", require("jdtls.dap").pick_test, desc = "Run Test" },
    })
  end
end

M.equinox_jar = function()
  -- INFO: It's annoying to edit the version again and again.
  local equinox_launcher = ""
  for _, file in pairs(M.equinox_path) do
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
  vim.list_extend(M.jar_patterns, { M.java_test_path })
end

M.debug = function()
  vim.list_extend(M.jar_patterns, { M.java_debug_path })
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
      local file_name = vim.fn.fnamemodify(bundle, ":t")
      if
        not vim.tbl_contains(M.env.EXCLUDE_JDTLS_JAR_BUNDLES, file_name)
        and not vim.tbl_contains(M.env.DUPLICATE_JAR_BUNDLES, file_name)
      then
        -- notify loading bundles but only filename not full path
        notify = vim.notify("Loading jar : " .. vim.fn.fnamemodify(bundle, ":t"), "info", { replace = notify })
        table.insert(bundles, bundle)
      end
    end
  end

  return bundles
end

-- How to find the project name for a given root dir.
M.project_name = function()
  return vim.fs.basename(M.root_dir)
end

-- Where are the config and workspace dirs for a project?
M.jdtls_config_dir = function()
  return M.env.JDTLS_EXT_DIR .. M.env.JDTLS_FOLDER_NAME .. "\\" .. M.env.JDTLS_CONFIG_OS_FOLDER_NAME
end

M.jdtls_workspace_dir = function()
  return vim.fn.stdpath "cache" .. "\\" .. M.env.JDTLS_FOLDER_NAME .. "\\" .. M.project_name() .. "\\workspace"
end

M.root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" }
M.handlers = require("lspconfig.configs.jdtls").default_config.handlers

M.init_options = {
  bundles = M.bundles(),
  workspaceFolders = M.jdtls_workspace_dir(),
}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.workspace.configuration = true
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

---@type JavaConfig
M.settings = {
  -- disable formatting,saveActions,and inlayHints because it crash jdtls
  -- disable codelens because it break jdtls and when not use it break jdtls when change file
  format = {
    enabled = false,
  },
  saveActions = {
    organizeImports = false,
  },
  inlayHints = {
    parameterNames = {
      -- none, literals, all
      enabled = "none",
    },
  },
  referencesCodeLens = {
    enabled = false,
  },
  implementationsCodeLens = {
    enabled = false,
  },
  trace = {
    server = "messages",
  },
  references = {
    includeDecompiledSources = true,
  },
  eclipse = {
    downloadSources = true,
  },
  maven = {
    updateSnapshots = true,
    downloadSources = true,
  },
  configuration = {
    updateBuildConfiguration = "interactive",
    runtimes = M.env.runtimes,
  },
  signatureHelp = { enabled = true },
  contentProvider = { preferred = "fernflower" },
  jdt = {
    ls = {
      lombokSupport = {
        enabled = true,
      },
    },
  },
  progressReports = {
    enabled = true,
  },
  sources = {
    organizeImports = {
      starThreshold = 5,
      staticStarThreshold = 5,
    },
  },
}

-- disable semantics tokens because it crash jdtls
M.on_init = function(client, _)
  client.server_capabilities.semanticTokensProvider = nil
end

M.config = function()
  return {
    flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 80,
      exit_timeout = false,
    },
    cmd = {
      "java",
      string.format("-javaagent:%s", M.lombok_jar),
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Xmx4g",
      "-Xms512M",
      "-Dlog.level=ALL",
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      "-jar",
      M.equinox_jar(),
      "-configuration",
      M.jdtls_config_dir(),
      "-data",
      M.jdtls_workspace_dir(),
    },

    root_dir = M.root_dir,
    single_file_support = true,
    init_options = M.init_options,
    handlers = M.handlers,

    capabilities = M.capabilities,
    on_attach = M.on_attach,
    on_init = M.on_init,

    settings = {
      java = M.settings,
    },
  }
end

return M
