-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
  local savedir = vim.fn.chdir(lazypath)
  vim.fn.system({ "git", "checkout", "7c493713bc2cb392706866eeba53aaef6c8e9fc6" })
  vim.fn.chdir(savedir)
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.coding.blink" },
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "plugins" },
  },
  defaults = { },
  install = { colorscheme = { "gruvbox", "retrobox", "habamax" } },
  checker = { enabled = false }, -- don't automatically check for plugin updates
})
