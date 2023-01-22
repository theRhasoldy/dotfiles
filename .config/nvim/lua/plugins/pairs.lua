return {
  {
    "windwp/nvim-ts-autotag",
    name = "autotag",
    lazy = true,
    event = "BufRead",
  },
  {
    "windwp/nvim-autopairs",
    name = "autopairs",
    lazy = true,
    event = "BufRead",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    name = "surround",
    lazy = true,
    event = "BufRead",
    config = function()
      require("nvim-surround").setup()
    end
  }
}
