return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
	{
		"nathom/filetype.nvim",
		name = "filetype",
		lazy = false,
		opts = {
			overrides = {
				html = "html",
				sh = "sh",
			},
			complex = {
				[".*git/config"] = "gitconfig", -- Included in the plugin
			},
			shebang = {
				dash = "sh",
			},
		},
	},
	"nvim-tree/nvim-web-devicons",
}
