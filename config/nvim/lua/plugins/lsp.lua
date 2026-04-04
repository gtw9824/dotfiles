return {
	-- JAVA & LSP ENGINE
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
			"nvim-java/nvim-java",
			"JavaHello/spring-boot.nvim",
		},
		config = function()
			local java_ok, java = pcall(require, "java")
			if java_ok then
				java.setup()
			end

			require("mason").setup()
			local servers = {
				"jdtls",
				"jsonls",
				"rust_analyzer",
				"pyright",
				"clangd",
				"html",
				"ts_ls",
				"omnisharp",
				"kotlin_language_server",
			}
			require("mason-lspconfig").setup({ ensure_installed = servers })

			local blink_ok, blink = pcall(require, "blink.cmp")
			local capabilities = blink_ok and blink.get_lsp_capabilities() or {}

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					install = true,
					capabilities = capabilities,
				})
			end

			vim.lsp.enable(servers)
		end,
	},
	-- AUTO FORMATTING
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
				kotlin = { "ktlint" },
				javascript = { "prettier" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
	-- TOOL INSTALLER
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"tree-sitter-cli",
					"google-java-format",
					"stylua",
					"black",
					"isort",
					"prettier",
					"ktlint",
				},
			})
		end,
	},
}
