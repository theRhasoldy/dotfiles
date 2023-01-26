return {
	name = "dahlia",
	lazy = false,
	priority = 1000,
	dev = true,
	dir = "~/Projects/Lua/nvim-dahlia/",
	config = function()
		vim.cmd.colorscheme("dahlia")
	end,
}
