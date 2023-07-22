return {
	"nathom/filetype.nvim",
	lazy = false,
	opts = {
		overrides = {
			extensions = {
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
	config = function(_, opts)
		require("filetype").setup(opts)
	end,
}
