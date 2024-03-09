return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.taplo = nil
    end,
  },
}
