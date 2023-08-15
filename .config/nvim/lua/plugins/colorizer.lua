return {
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufReadPre",
		opts = {
			render = "first_column", -- or 'foreground' or 'first_column'
			enable_named_colors = true,
			enable_tailwind = false,
		},
	},
}
