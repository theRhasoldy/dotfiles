return {
	{
		"numToStr/Comment.nvim",
		name = "Comment",
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
		event = "BufReadPre",
	},
	{
		"hrsh7th/nvim-insx",
		event = "BufReadPre",
		dependencies = {
			"andymass/vim-matchup",
			config = function()
				vim.g.matchup_matchparen_offscreen = { method = "popup" }
			end,
		},
		config = function()
			require("insx.preset.standard").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		name = "surround",
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
