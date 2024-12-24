local map = vim.keymap

map.set("n", "<c-o>", "<cmd>Telescope buffers <CR>")
map.set("n", "<c-f>", "<cmd>Telescope live_grep <CR>")
map.set("n", "<leader>fh", "<cmd>Telescope help_tags <CR>")

map.set("n", "<c-p>", function()
  require("telescope").extensions.frecency.frecency({
    workspace = "CWD",
    previewer = false,
    path_display = { "filename_first" },
  })
end)
return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    opts = {
      extensions = {
        frecency = {
          db_safe_mode = false,
          matcher = "fuzzy",
          show_scores = false,
          show_filter_column = false,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        file_ignore_patterns = {
          ".git",
          ".xlsx",
          ".rar",
          ".zip",
          ".exe",
          ".png",
          ".jpeg",
          ".jpg",
          ".pdf",
          ".bin",
          ".mkv",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        buffers = {
          sort_mru = true,
          ignore_current_buffer = true,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  -- Fzf can't be installed
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = false },
}
