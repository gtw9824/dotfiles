return {
	-- COLORSCHEME
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 1
			vim.cmd([[colorscheme everforest]])
		end,
	},
	-- FILE EXPLORER
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	-- FLOATING TERMINAL
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<C-t>]],
				direction = "float",
				float_opts = {
					border = "curved",
					winblend = 3,
				},
			})
		end,
	},
}
