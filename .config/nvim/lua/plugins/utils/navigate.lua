return {
  "knubie/vim-kitty-navigator",
  event = "VeryLazy",
  keys = {
    {
      "<Left>",
      "<cmd>KittyNavigateLeft<CR>",
      {
        silent = true,
      },
    },
    {
      "<Right>",
      "<cmd>KittyNavigateRight<CR>",
      {
        silent = true,
      },
    },

    {
      "<Up>",
      "<cmd>KittyNavigateUp<CR>",
      {
        silent = true,
      },
    },
    {
      "<Down>",
      "<cmd>KittyNavigateDown<CR>",
      {
        silent = true,
      },
    },
  },
}
