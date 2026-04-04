-- LEADER KEY
vim.g.mapleader = " "

local opt = vim.opt

-- QUALITY OF LIFE SETTINGS
opt.mouse = "a"
opt.number = true
opt.shiftwidth = 4

-- GLOBAL SECRETS AND PATHS
local has_secrets, secrets = pcall(require, "local_secrets")
_G.get_secret = function(key, default)
	if has_secrets and secrets[key] then
		return secrets[key]
	end
	return default
end

-- ACCESS local_secrets.lua
_G.java_25_path = _G.get_secret("java_25_path", "/placeholder")
_G.java_26_path = _G.get_secret("java_26_path", "/placeholder")
