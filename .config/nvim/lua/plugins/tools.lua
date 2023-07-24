return {
	-- lazy.nvim
	{
		"chrisgrieser/nvim-early-retirement",
		event = "VeryLazy",
		opts = {
			ignoreSpecialBuftypes = false,
			notificationOnAutoClose = true,
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
