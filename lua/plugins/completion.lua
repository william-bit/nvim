return {
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-j>"] = { "show", "show_documentation", "hide_documentation" },
        ["<Enter>"] = { "select_and_accept", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
      },
      completion = {
        menu = {
          draw = {
            columns = { { "kind_icon", gap = 10 }, { "label", "label_description" }, { "kind" } },
          },
          components = {
            label = {
              width = { fill = true, min = 60 },
            },
          },
        },
      },
      appearance = {
        kind_icons = require("config.style").CMP_ICONS,
      },
    },
  },
}
