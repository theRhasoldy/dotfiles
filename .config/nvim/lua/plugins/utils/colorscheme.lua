return {
  {
    name = "dahlia",
    lazy = true,
    -- priority = 1000,
    dev = true,
    dir = "~/Projects/Lua/nvim-dahlia/",
    -- config = function()
    --   vim.cmd.colorscheme("dahlia")
    -- end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    opts = {
      disable_background = true,
      dim_nc_background = false,
      disable_float_background = true,
      highlight_groups = {
        Variable = { fg = "love" },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   opts = {
  --     transparent_background = false,
  --   },
  --   config = function()
  --     vim.cmd.colorscheme("catppuccin-mocha")
  --   end,
  -- },
}
