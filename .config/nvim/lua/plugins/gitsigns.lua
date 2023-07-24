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
			current_line_blame = false, -- Toggle with command
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 200,
				ignore_whitespace = false,
			},
			worktrees = {
				gitdir = vim.env.HOME .. "~/.config/dotfiles/",
			},
		},
		keys = {
			{
				"<Leader>gb",
				"<cmd>Gitsigns toggle_current_line_blame<CR>",
				desc = "Toggle line blame",
			},
		},
	},
}
