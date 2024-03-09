vim.lsp.inlay_hint = true
vim.opt.scrolloff = 2
vim.opt.colorcolumn = "+1"
vim.opt.textwidth = 80
vim.api.nvim_create_user_command("Strp", [[%s/\s\+\n/\r/g]], {})
