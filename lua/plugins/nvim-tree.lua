dofile(vim.g.base46_cache .. "nvimtree")

return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return {
        override = {
          default_icon = { icon = "󰈚", name = "Default" },
          js = { icon = "󰌞", name = "js" },
          ts = { icon = "󰛦", name = "ts" },
          lock = { icon = "󰌾", name = "lock" },
          ["robots.txt"] = { icon = "󰚩", name = "robots" },
        },
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", mode = { "n" }, desc = "nvimtree focus window" },
      {
        "<A-b>",
        function()
          require("nvim-tree.api").tree.toggle()
        end,
        desc = "nvimtree toggle explorer",
      },
    },
    opts = {
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        width = 40,
        preserve_window_proportions = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 1500,
      },
      renderer = {
        group_empty = true,
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
            },
            git = { unmerged = "" },
          },
        },
      },
    },
  },
}
