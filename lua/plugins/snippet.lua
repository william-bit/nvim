return {
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load {
            paths = {
              "~/AppData/Local/nvim/snippet/phpstorm-snippets-for-vscode",
              vim.fn.stdpath "config" .. "/snippets",
            },
          }
          local list_snips = function()
            local ft_list = require("luasnip").available()[vim.o.filetype]
            local ft_snips = {}
            for _, item in pairs(ft_list) do
              ft_snips[item.trigger] = item.name
            end
            print(vim.inspect(ft_snips))
          end
          vim.api.nvim_create_user_command("LuaSnipListShort", list_snips, {})
        end,
      },
    },

    opts = function()
      local ls = require "luasnip"
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local d = ls.dynamic_node

      ls.add_snippets("go", {
        s({ trig = "!", name = "Not same" }, {
          i(1, "name"),
          t { "!=" },
          i(2, "value"),
        }),
        s({ trig = ";", name = "Create variable" }, {
          i(1, "name"),
          t { ":=" },
          i(2, "value"),
        }),
        s({ trig = ";s", name = "Create variable string" }, {
          i(1, "name"),
          t { ':= "' },
          i(2, "value"),
          t { '"' },
        }),
        s({ trig = "ts", name = "Create struct" }, {
          t { "type " },
          i(1, "name"),
          t { " struct {", "\t" },
          i(2),
          t { "", "}" },
        }),
        s({ trig = "ti", name = "Create interface" }, {
          t { "type " },
          i(1, "name"),
          t { " interface {", "\t" },
          i(2),
          t { "", "}" },
        }),
        s({ trig = "pkg", name = "Create main" }, {
          t { "package main", "", "func main() {", "\t" },
          i(1),
          t { "", "}" },
        }),
      }, {
        key = "go",
      })

      ls.add_snippets("php", {
        s({ trig = ";", name = "go variable" }, {
          t { "$" },
          i(1, "name"),
          t { "=" },
          i(2, "value"),
          t { ";" },
        }),
        s({ trig = ";s", name = "go variable string" }, {
          t { "$" },
          i(1, "name"),
          t { '= "' },
          i(2, "value"),
          t { '";' },
        }),
      }, {
        key = "php",
      })
      return {
        history = true,
        delete_check_events = "TextChanged",
      }
    end,
  },
}
