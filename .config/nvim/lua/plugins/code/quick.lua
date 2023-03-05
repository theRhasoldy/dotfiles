return {
  {
    "numToStr/Comment.nvim",
    name = "Comment",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local present, comment = pcall(require, "Comment")
      if not present then
        return
      end
      comment.setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    name = "autotag",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "hrsh7th/nvim-insx",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "andymass/vim-matchup",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "status" }
      end,
    },
    config = function()
      require("insx.preset.standard").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    name = "surround",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local present, surround = pcall(require, "nvim-surround")
      if not present then
        return
      end
      surround.setup()
    end,
  },
}
