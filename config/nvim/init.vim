set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" nvim-lspconfig
lua <<EOF
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

local lsp_attach = function(client, bufnr)
  -- jump to xyz
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  -- other keybinds
  vim.keymap.set('n', 'Q', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr')
end

lspconfig.rust_analyzer.setup{
  on_attach = lsp_attach,
  handlers = {
    ['window/showStatus'] = vim.lsp.handlers['window/showMessage'],
  },
  settings = {
    ['rust-analyzer'] = {
      procMacro = {
        enable = false,
      },
      diagnostics = {
        disabled = {
          'unresolved-proc-macro',
        },
      },
    },
  },
}
EOF
