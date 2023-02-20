return {
	{
		"knubie/vim-kitty-navigator",
		event = "UIEnter",
		keys = {
			{
				"<C-h>",
				"<cmd>KittyNavigateLeft<CR>",
				{
					silent = true,
					noremap = true,
				},
			},
			{
				"<C-l>",
				"<cmd>KittyNavigateRight<CR>",
				{
					silent = true,
					noremap = true,
				},
			},

			{
				"<C-k>",
				"<cmd>KittyNavigateUp<CR>",
				{
					silent = true,
					noremap = true,
				},
			},
			{
				"<C-j>",
				"<cmd>KittyNavigateDown<CR>",
				{
					silent = true,
					noremap = true,
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				window = {
					border = "single",
				},
			})
		end,
	},
}
