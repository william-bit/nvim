return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<c-o>", "<cmd>FzfLua buffers<CR>" },
      { "<c-f>", "<cmd>FzfLua live_grep<CR>" },
      { "<c-p>", "<cmd>FzfLua files<CR>" },
      { "<c-t>", "<cmd>FzfLua git_status<CR>" },
      { "<c-x>", "<cmd>FzfLua oldfiles<CR>" },
      { "gD", "<cmd>FzfLua lsp_declarations<CR>", desc = "Lsp Go to declaration", mode = { "n" } },
      { "gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "Lsp Go to definition", mode = { "n" } },
      { "gy", "<cmd>FzfLua lsp_definitions<CR>", desc = "Lsp Document Symbol", mode = { "n" } },
      { "gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "Lsp Go to implementation", mode = { "n" } },
      { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Lsp Go to references", mode = { "n" } },
      { "g.", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Lsp code action", mode = { "n" } },
      { "<leader>D", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Lsp Go to type definition", mode = { "n" } },
      { "<leader>fh", "<cmd>FzfLua help_tags<CR>", mode = { "n" } },
    },
    opts = function()
      -- use `fzf-lua` for replace vim.ui.select
      require("fzf-lua").register_ui_select()

      return {
        keymap = {
          fzf = {
            -- Send finding to quick fix like telescope
            ["ctrl-q"] = "select-all+accept",
          },
        },
        oldfiles = {
          color_icons = false,
          stat_file = true, -- verify files exist on disk
        },
        files = {
          previewer = false,
          color_icons = false,
          path_shorten = false,
          multiprocess = true,
        },
        grep = {
          color_icons = false,
          path_shorten = true,
          multiprocess = true,
        },
        buffers = {
          color_icons = false,
          path_shorten = true,
        },
        git = {
          files = {
            color_icons = false,
          },
          status = {
            color_icons = false,
          },
        },
        lsp = {
          color_icons = false,
          code_actions = {
            previewer = false,
          },
        },
        ui_select = function(fzf_opts, items)
          return vim.tbl_deep_extend("force", fzf_opts, {
            prompt = " ",
            winopts = {
              title = " " .. vim.trim((fzf_opts.prompt or "Select"):gsub("%s*:%s*$", "")) .. " ",
              title_pos = "center",
            },
          }, fzf_opts.kind == "codeaction" and {
            winopts = {
              layout = "vertical",
              -- height is number of items minus 15 lines for the preview, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8 - 16, #items + 2) + 0.5) + 16,
              width = 0.5,
              preview = {
                layout = "vertical",
                vertical = "down:15,border-top",
              },
            },
          } or {
            winopts = {
              width = 0.5,
              -- height is number of items, with a max of 80% screen height
              height = math.floor(math.min(vim.o.lines * 0.8, #items + 2) + 0.5),
            },
          })
        end,
      }
    end,
  },
}
