vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

vim.opt.scrolloff = 2
vim.opt.relativenumber = false
vim.opt.conceallevel = 0

vim.api.nvim_create_user_command("Strp", [[%s/\s\+\n/\r/g]], {})

vim.api.nvim_command("autocmd TermOpen * startinsert")
vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no")
