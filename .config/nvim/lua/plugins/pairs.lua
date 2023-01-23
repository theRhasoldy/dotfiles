return {
	{
		"windwp/nvim-ts-autotag",
		name = "autotag",
		lazy = true,
		event = "BufRead",
	},
	{
		"windwp/nvim-autopairs",
		name = "autopairs",
		lazy = true,
		event = "BufRead",
		config = function()
			local present, npairs = pcall(require, "nvim-autopairs")
			if not present then
				return
			end
			npairs.setup({
				enable_check_bracket_line = true, --- check bracket in same line
				check_ts = true,
				ignored_next_char = [=[]=],
			})

			local endwise = require("nvim-autopairs.ts-rule").endwise
			require("nvim-autopairs").add_rules({
				endwise("then$", "end", "lua", "if_statement"),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		name = "surround",
		lazy = true,
		event = "BufRead",
		config = function()
			local present, surround = pcall(require, "nvim-surround")
			if not present then
				return
			end
			surround.setup()
		end,
	},
}
