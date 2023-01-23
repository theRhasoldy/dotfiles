local cmd = vim.api.nvim_command

-- Show cursor line only on current buffer
cmd([[au BufEnter * setlocal cursorline]])
cmd([[au BufLeave * setlocal nocursorline]])
cmd([[au WinEnter * setlocal cursorline]])
cmd([[au WinLeave * setlocal nocursorline]])

return {
	{
		name = "dahlia",
		lazy = false,
		priority = 1000,
		dev = true,
		dir = "~/Projects/Lua/nvim-dahlia/",
		config = function()
			vim.cmd.colorscheme("dahlia")
		end,
	},
}
