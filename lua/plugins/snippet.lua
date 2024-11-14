return {
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = {
          "~/AppData/Local/nvim/snippet/phpstorm-snippets-for-vscode",
        },
      })
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
}
