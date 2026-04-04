-- COMPLETION ENGINE
return {
	{
		"saghen/blink.cmp",
		branch = "main",
		build = "cargo build --release",
		dependencies = "rafamadriz/friendly-snippets",
		opts = {
			appearance = { nerd_font_variant = "mono" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
	-- SYNTAX ENGINE
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local java_path = _G.java_25_path
			vim.env.PATH = "/opt/homebrew/bin:" .. java_path .. "/bin:" .. vim.env.PATH
			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"python",
					"java",
					"rust",
					"cpp",
					"kotlin",
					"javascript",
					"html",
					"json",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
