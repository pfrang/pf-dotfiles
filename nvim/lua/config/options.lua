-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.clipboard = ""
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- show whitespace: leading spaces as dots, tabs, trailing spaces, non-breaking spaces
vim.opt.list = true
vim.opt.listchars = { lead = "·", tab = "» ", trail = "·", nbsp = "␣" }
