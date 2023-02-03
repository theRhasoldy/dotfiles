return {
	{
		"tummetott/reticle.nvim",
		event = "BufReadPre",
		opts = {
			never = {
				cursorline = {
					"noice",
					"TelescopePrompt",
				},
			},
		},
		config = function(_, opts)
			vim.opt.cursorline = true
			require("reticle").setup(opts)
		end,
	},
	{
		"arnamak/stay-centered.nvim",
		event = "BufReadPre",
		config = function()
			require("stay-centered")
		end,
	},
}
