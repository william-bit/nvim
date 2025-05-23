return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = function()
      local keys = {
        {
          "<c-j>",
          function()
            require("toggleterm").toggle()
          end,
          desc = "terminal toggleable vertical term at button",
          mode = { "n", "t" },
        },
        {
          "<a-i>",
          function()
            require("configs.term.lazygit").toggle()
          end,
          desc = "Lazygit (Root Dir)",
          mode = { "n", "t" },
        },
        {
          "<c-c>",
          function()
            require("configs.term.lazygit").lazygit:close()
          end,
          desc = "Terminal hide",
          mode = { "t" },
        },
      }

      for i = 10, 1, -1 do
        table.insert(keys, {
          "<A-" .. i .. ">",
          function()
            require("toggleterm").toggle(i, 10, "git_dir", "horizontal", "terminal" .. i)
          end,
          desc = "terminal toggleable vertical term " .. i,
          mode = { "n", "t" },
        })
      end
      return keys
    end,
    opts = function()
      dofile(vim.g.base46_cache .. "term")
      require("configs.term.lazygit").hide()
      return {
        shade_terminals = false,
        shade_filetypes = {},
        hide_numbers = true,
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = true,
        close_on_exit = true,
        float_opts = {
          -- The border key is *almost* the same as 'nvim_open_win'
          -- see :h nvim_open_win for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          border = "curved",
          -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
          winblend = 4,
          title_pos = "left",
        },
      }
    end,
  },
}
