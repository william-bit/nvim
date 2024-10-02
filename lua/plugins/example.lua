-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

---@type "bordered" | "borderless"
local style = "borderless"

local M = {}

M.base_30 = {
  white = "#ebdbb2",
  darker_black = "#232323",
  black = "#282828", --  nvim bg
  black2 = "#2e2e2e",
  one_bg = "#353535",
  one_bg2 = "#3f3f3f",
  one_bg3 = "#444444",
  grey = "#4b4b4b",
  grey_fg = "#4e4e4e",
  grey_fg2 = "#505050",
  light_grey = "#656565",
  red = "#fb4934",
  baby_pink = "#cc241d",
  pink = "#ff75a0",
  line = "#36393a", -- for lines like vertsplit
  green = "#b8bb26",
  vibrant_green = "#a9b665",
  nord_blue = "#83a598",
  blue = "#458588",
  yellow = "#d79921",
  sun = "#fabd2f",
  purple = "#b4bbc8",
  dark_purple = "#d3869b",
  teal = "#749689",
  orange = "#e78a4e",
  cyan = "#82b3a8",
  statusline_bg = "#2c2c2c",
  lightbg = "#3d3d3d",
  pmenu_bg = "#83a598",
  folder_bg = "#749689",
}

M.base_16 = {
  base00 = "#282828",
  base01 = "#3c3836",
  base02 = "#423e3c",
  base03 = "#484442",
  base04 = "#bdae93",
  base05 = "#d5c4a1",
  base06 = "#ebdbb2",
  base07 = "#fbf1c7",
  base08 = "#fb4934",
  base09 = "#fe8019",
  base0A = "#fabd2f",
  base0B = "#b8bb26",
  base0C = "#8ec07c",
  base0D = "#83a598",
  base0E = "#d3869b",
  base0F = "#d65d0e",
}

local colors = M.base_30

local hlgroups = {

  TelescopePromptPrefix = {
    fg = colors.red,
    bg = colors.black2,
  },

  TelescopeNormal = { bg = colors.darker_black },

  TelescopePreviewTitle = {
    fg = colors.black,
    bg = colors.green,
  },

  TelescopePromptTitle = {
    fg = colors.black,
    bg = colors.red,
  },

  TelescopeSelection = { bg = colors.black2, fg = colors.white },
  TelescopeResultsDiffAdd = { fg = colors.green },
  TelescopeResultsDiffChange = { fg = colors.yellow },
  TelescopeResultsDiffDelete = { fg = colors.red },

  TelescopeMatching = { bg = colors.one_bg, fg = colors.blue },
}

local styles = {
  borderless = {
    TelescopeBorder = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
    TelescopeResultsBorder = { bg = colors.darker_black, fg = colors.darker_black },
    TelescopePreviewBorder = { bg = colors.darker_black, fg = colors.darker_black },
    TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
    TelescopeResultsTitle = { fg = colors.darker_black, bg = colors.darker_black },
    TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },
  },

  bordered = {
    TelescopeBorder = { fg = colors.one_bg3 },
    TelescopePromptBorder = { fg = colors.one_bg3 },
    TelescopeResultsBorder = { fg = colors.one_bg3 },
    TelescopePreviewBorder = { fg = colors.one_bg3 },
    TelescopeResultsTitle = { fg = colors.black, bg = colors.green },
    TelescopePreviewTitle = { fg = colors.black, bg = colors.blue },
    TelescopePromptPrefix = { fg = colors.red, bg = colors.black },
    TelescopeNormal = { bg = colors.black },
    TelescopePromptNormal = { bg = colors.black },
  },
}

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      require("gruvbox").setup({
        overrides = vim.tbl_deep_extend("force", hlgroups, styles[style]),
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}
