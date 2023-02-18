return {
  "ThePrimeagen/refactoring.nvim",
  keys = {
    {
      "<leader>rr",
      function()
        require("telescope").extensions.refactoring.refactors()
      end,
      mode = "v",
      noremap = true,
      silent = true,
      expr = false,
    },
  },
}
