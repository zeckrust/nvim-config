vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.fileformat = "unix"
vim.opt.encoding = "utf-8"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
		{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
		{ out, "WarningMsg" },
		{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Colortheme
vim.cmd.colorscheme "ayu"

-- Keybindings
vim.keymap.set("n", "<leader><Up>", "<C-w>k", {})
vim.keymap.set("n", "<leader><Down>", "<C-w>j", {})
vim.keymap.set("n", "<leader><Left>", "<C-w>h", {})
vim.keymap.set("n", "<leader><Right>", "<C-w>l", {})

vim.keymap.set("v", "<Tab>", ">gv", {})
vim.keymap.set("v", "<S-Tab>", "<gv", {})
