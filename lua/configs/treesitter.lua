pcall(function()
	dofile(vim.g.base46_cache .. "syntax")
	dofile(vim.g.base46_cache .. "treesitter")
end)

return {
	ensure_installed = {
		"bash",
		"go",
		"gomod",
		"gosum",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"php",
		"printf",
		"python",
		"query",
		"regex",
		"sql",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = { enable = true },
}
