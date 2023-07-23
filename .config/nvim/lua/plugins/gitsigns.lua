return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
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
	},
}
