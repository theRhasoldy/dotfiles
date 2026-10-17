return {
  {
    "mellow-theme/mellow.nvim",
    config = function()
      vim.g.mellow_transparent = true
      vim.g.mellow_italic_keywords = true
      vim.g.mellow_bold_functions = true
      vim.g.mellow_italic_booleans = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
