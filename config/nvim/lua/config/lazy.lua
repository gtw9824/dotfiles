-- BOOTSTRAP ENGINE
local lazypath = vim.fn.stdpath("data")  .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "git@github.com:folke/lazy.nvim.git"
    vim.fn.system({
	"git", "clone", "--filter=blob:none", "--branch=stable",
	lazyrepo,
	lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

-- AUTO LOAD ALL FILES IN luz/plugins/
require("lazy").setup("plugins", {
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    git = { timeout = 300, terminal_defaults = true, },
    checker = { enabled = false },
})
