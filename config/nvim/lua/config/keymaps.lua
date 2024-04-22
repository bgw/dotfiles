-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- in theory, these are useful, but nvim/terminals often interpret ESC followed
-- by a quick movement (j/k) as holding Alt and pressing j/k, so it causes too
-- many false triggers, see `:help map-alt-keys`
vim.keymap.del({"n", "i", "v"}, "<A-j>")
vim.keymap.del({"n", "i", "v"}, "<A-k>")
