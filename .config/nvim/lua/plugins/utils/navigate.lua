return {
  --[[ {
    "knubie/vim-kitty-navigator",
    event = "VeryLazy",
    keys = {
      {
        "<C-h>",
        "<cmd>KittyNavigateLeft<CR>",
        {
          silent = true,
          noremap = true,
        },
      },
      {
        "<C-l>",
        "<cmd>KittyNavigateRight<CR>",
        {
          silent = true,
          noremap = true,
        },
      },

      {
        "<C-k>",
        "<cmd>KittyNavigateUp<CR>",
        {
          silent = true,
          noremap = true,
        },
      },
      {
        "<C-j>",
        "<cmd>KittyNavigateDown<CR>",
        {
          silent = true,
          noremap = true,
        },
      },
    },
  }, ]]
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    event = "BufReadPre",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = {
          border = "single",
        },
      })
    end,
  },
}
