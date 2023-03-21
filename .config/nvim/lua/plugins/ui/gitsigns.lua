return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    name = "gitsigns",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = {
          text = "/",
        },
      },
      signcolumn = true,
      numhl = false,
      attach_to_untracked = false,
      current_line_blame = true,
      worktrees = {
        gitdir = vim.env.HOME .. "~/.config/dotfiles/",
      },
    },
    keys = {
      {
        "<Leader>gd",
        "<cmd>Gitsigns diffthis<CR>",
        desc = "Git diff",
      },
    },
  },
  {
    "redve-dev/CommitReminder",
    event = "BufReadPre",
    opts = {
      required_changes = 20,
    },
  },
}
