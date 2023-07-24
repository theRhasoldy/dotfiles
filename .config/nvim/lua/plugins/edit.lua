return {
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup({
				-- Use treesitter-commentstring to detect comments in jsx, astro... etc
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"monaqa/dial.nvim",
		event = "VeryLazy",
	},
}
