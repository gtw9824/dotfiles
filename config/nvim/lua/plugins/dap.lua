-- DAP
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap_ok, dap = pcall(require, "dap")
			local dapui_ok, dapui = pcall(require, "dapui")

			if dapui_ok then
				dapui.setup()
			end

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "BREAKPOINT" })
			vim.keymap.set("n", "<leader>dc", function()
				if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "terminal" then
					print("MOVE INTO CODE BEFORE DEBUG")
				else
					dap.continue()
				end
			end, { desc = "DEBUG CONTINUE" })
		end,
	},
}
