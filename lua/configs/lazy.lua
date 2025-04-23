return {
  rocks = { enabled = false },
  spec = require "plugins/out/plugins",
  -- Configure any other settings here. See the documentation for more details.

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nvchad" } },

  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  -- Set this to `true` to have all your plugins lazy-loaded by default.
  defaults = { lazy = true },

  -- automatically check for plugin updates
  checker = { enabled = false },

  -- automatically check for config file changes and reload the ui
  change_detection = { enabled = false },

  -- Performance settings
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
