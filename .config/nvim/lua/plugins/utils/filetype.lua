return {
	"nathom/filetype.nvim",
	lazy = true,
	event = "BufReadPre",
	opts = {
		overrides = {
			literal = {
				MyBackupFile = "lua",
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
		vim.g.did_load_filetypes = 1
		require("filetype").setup(opts)
	end,
}
