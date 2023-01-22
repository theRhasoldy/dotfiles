return {
  {
    "williamboman/mason.nvim",
    name = "mason",
    event = "BufReadPre",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  "williamboman/mason-lspconfig.nvim",
}
