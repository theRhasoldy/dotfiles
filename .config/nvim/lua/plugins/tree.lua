return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function(_, opts)
      require("neo-tree").setup({
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      })
    end,
  }
}
