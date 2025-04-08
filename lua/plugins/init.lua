return {
	{
		"stevearc/conform.nvim",
		-- event = "BufWritePre", -- uncomment for format on save
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				desc = "Format File",
			},
		},
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		event = { "VeryLazy", "User FilePost" },
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			require("nvim-treesitter.install").compilers = { "zig" }
			return require("configs.treesitter")
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
