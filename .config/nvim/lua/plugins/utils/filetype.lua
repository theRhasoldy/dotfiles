return {
  "nathom/filetype.nvim",
  opts = {
    overrides = {
      extensions = {
        html = "html",
      },
      complex = {
        [".*git/config"] = "gitconfig", -- Included in the plugin
      },
      shebang = {
        dash = "sh",
      },
    },
  },

  config = function(_, opts)
    require("filetype").setup(opts)
  end,
}
