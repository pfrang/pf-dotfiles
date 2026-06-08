-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { noremap = true, desc = "Delete to void" })
vim.keymap.set("n", "<leader>dd", '"_dd', { noremap = true, desc = "Delete line to void" })
