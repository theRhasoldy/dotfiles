return {
  {
    name = "dahlia",
    lazy = false,
    priority = 1000,
    dev = true,
    dir = "~/Projects/Lua/dahlia.nvim/",
    config = function()
      vim.cmd.colorscheme("dahlia")
    end,
  },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   priority = 1000,
  --   lazy = false,
  --   opts = {
  --     variant = "moon",
  --     disable_background = true,
  --     dim_nc_background = false,
  --     disable_float_background = true,
  --     highlight_groups = {
  --       Variable = { fg = "love" },
  --     },
  --   },
  --   config = function(_, opts)
  --     require("rose-pine").setup(opts)
  --     vim.cmd.colorscheme("rose-pine")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    -- lazy = false,
    name = "catppuccin",
    config = function()
      -- vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
