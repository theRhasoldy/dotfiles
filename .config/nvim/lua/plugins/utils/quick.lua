return {
  {
    "numToStr/Comment.nvim",
    name = "Comment",
    lazy = true,
    event = "BufReadPre",
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
    lazy = true,
    event = "BufReadPre",
  },
  {
    "windwp/nvim-autopairs",
    name = "autopairs",
    lazy = true,
    event = "BufReadPre",
    opts = {
      enable_check_bracket_line = true, --- check bracket in same line
      check_ts = true,
      ignored_next_char = [=[]=],
    },
    config = function(_, opts)
      local present, npairs = pcall(require, "nvim-autopairs")
      if not present then
        return
      end
      npairs.setup(opts)

      local endwise = require("nvim-autopairs.ts-rule").endwise
      require("nvim-autopairs").add_rules({
        endwise("then$", "end", "lua", "if_statement"),
        endwise("()$", "end", "lua", "function"),
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    name = "surround",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local present, surround = pcall(require, "nvim-surround")
      if not present then
        return
      end
      surround.setup()
    end,
  },
}
