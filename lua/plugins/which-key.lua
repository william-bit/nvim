return {
	{
		"folke/which-key.nvim",
		event = "BufRead",
		keys = {
			"<leader>",
			"<c-w>",
			'"',
			"'",
			"`",
			"c",
			"v",
			"g",
			-- Which-key as fix spell check
			{
				"<c-l>",
				function()
					require("which-key").show("z=", { mode = "n", auto = true })
				end,
				desc = "Fix spell check",
				mode = { "n" },
			},
		},
		cmd = "WhichKey",
		opts = function()
			dofile(vim.g.base46_cache .. "whichkey")
			return {}
		end,
	},
}
