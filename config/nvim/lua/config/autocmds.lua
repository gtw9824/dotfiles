local create_autocmd = vim.api.nvim_create_autocmd

-- TERMINAL AUTCMDS
create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function()
	set_terminal_keymaps()
    end,
})

-- START TREESITTER
create_autocmd("FileType", {
    pattern = "java",
    callback = function()
	vim.treesitter.start()
    end,
})
