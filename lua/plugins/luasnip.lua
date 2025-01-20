return {
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local d = ls.dynamic_node

      ls.add_snippets("go", {
        s({ trig = "!", name = "Not same" }, {
          i(1, "name"),
          t({ "!=" }),
          i(2, "value"),
        }),
        s({ trig = ";", name = "Create variable" }, {
          i(1, "name"),
          t({ ":=" }),
          i(2, "value"),
        }),
        s({ trig = ";s", name = "Create variable string" }, {
          i(1, "name"),
          t({ ':= "' }),
          i(2, "value"),
          t({ '"' }),
        }),
        s({ trig = "ts", name = "Create struct" }, {
          t({ "type " }),
          i(1, "name"),
          t({ " struct {", "\t" }),
          i(2),
          t({ "", "}" }),
        }),
        s({ trig = "ti", name = "Create interface" }, {
          t({ "type " }),
          i(1, "name"),
          t({ " interface {", "\t" }),
          i(2),
          t({ "", "}" }),
        }),
        s({ trig = "pkg", name = "Create main" }, {
          t({ "package main", "", "func main() {", "\t" }),
          i(1),
          t({ "", "}" }),
        }),
      }, {
        key = "go",
      })

      ls.add_snippets("php", {
        s({ trig = ";", name = "go variable" }, {
          t({ "$" }),
          i(1, "name"),
          t({ "=" }),
          i(2, "value"),
          t({ ";" }),
        }),
        s({ trig = ";s", name = "go variable string" }, {
          t({ "$" }),
          i(1, "name"),
          t({ '= "' }),
          i(2, "value"),
          t({ '";' }),
        }),
      }, {
        key = "php",
      })
    end,
  },
}
