return {
	{
		"axkirillov/hbac.nvim",
		event = "BufEnter",
		opts = {
			autoclose = true,
			threshold = 20,
		},
		keys = {
			{
				"<leader>fb",
				"<cmd>Hbac telescope<CR>",
				desc = "Browse Open Buffers",
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				["<space>"] = "spc",
				["<CR>"] = "ret",
				["<tab>"] = "tab",
			},
			window = {
				border = "single", -- none, single, double, shadow
				winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			},
		},
	},
}
