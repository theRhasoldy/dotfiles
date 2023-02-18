return {
	"tzachar/local-highlight.nvim",
	cmd = "BufReadPre",
	config = function()
		require("local-highlight").setup({
			hlgroup = "Visual",
		})
	end,
}
