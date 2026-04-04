local keymap = vim.keymap.set

-- 1. FILE TREE TOGGLE
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "EXPLORER" })

-- 2. SMART TERMINAL (HORIZANTAL SPLIT AT BOTTOM)
local function toggle_terminal()
	local term_buf = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buftype == "terminal" then
			term_buf = buf
			break
		end
	end

	if term_buf then
		vim.api.nvim_buf_delete(term_buf, { force = true })
	else
		vim.cmd("botright 15split | term")
		vim.cmd("startinsert")
	end
end
keymap("n", "<leader>st", toggle_terminal, { desc = "TOGGLETERMINAl" })

-- 3. TREESITTER & DASHBOARD
local function toggle_master_dashboard()
	local qf_winid = nil
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_winid = win.winid
		end
	end

	if qf_winid then
		vim.cmd("cclose")
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.bo[buf].buftype == "terminal" then
				vim.cmd("bdelete! " .. buf)
			end
		end
	else
		vim.cmd("only")
		vim.cmd("botright 15copen")
		vim.cmd("vert rightbelow vnew | term")
		vim.cmd("wincmd h")

		local one_third = math.floor(vim.o.columns * 0.33)

		vim.cmd("vertical resize " .. tostring(one_third))
		vim.cmd("wincmd k")
	end
end
keymap("n", "<leader>tt", toggle_master_dashboard, { desc = "TOGGLE MASTER DASHBOARD" })

-- 4. GLOBAL TERMINAL KEYMAP
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	keymap("t", "<C-t>", [[<C-\><cmd>ToggleTerm<CR>]], opts)
	keymap("t", "<Esc><Esc>", [[<C-\><C-n>]], opts)
end
