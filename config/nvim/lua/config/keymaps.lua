-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>ut", function()
  vim.o.relativenumber = not vim.o.relativenumber
  vim.o.number = not vim.o.number
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
  vim.o.list = not vim.o.list
end, { desc = "Toggle line numbers and gutter" })
