-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
  local savedir = vim.fn.chdir(lazypath)
  vim.fn.system({ "git", "checkout", "83493db50a434a4c5c648faf41e2ead80f96e478" })
  vim.fn.chdir(savedir)
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "plugins" },
  },
  defaults = { },
  install = { colorscheme = { "gruvbox", "retrobox", "habamax" } },
  checker = { enabled = false }, -- don't automatically check for plugin updates
})
