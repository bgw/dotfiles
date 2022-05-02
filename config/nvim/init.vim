set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" nvim-lspconfig
lua <<EOF
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

local lsp_attach = function(client)
  vim.api.nvim_buf_set_keymap(0, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
  vim.api.nvim_buf_set_keymap(0, "n", "gD", "<Cmd>lua vim.lsp.buf.implementation()<CR>", {})
  vim.api.nvim_buf_set_keymap(0, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
  vim.api.nvim_buf_set_keymap(0, "n", "Q", "<Cmd>lua vim.lsp.buf.formatting()<CR>", {})
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.rust_analyzer.setup{
  on_attach = lsp_attach,
  handlers = {
    ['window/showStatus'] = vim.lsp.handlers['window/showMessage'],
  },
}
EOF
