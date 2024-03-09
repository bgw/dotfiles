return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.lua_ls = nil
    end,
  },
}
