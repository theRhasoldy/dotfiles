return {
	{
		"nvim-telescope/telescope.nvim",
		name = "telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = "close",
					},
					n = {
						["q"] = "close",
					},
				},
				layout_strategy = "vertical",
				vimgrep_arguments = {
					"rg",
					"--with-filename",
					"--line-number",
					"--smart-case",
					"--column",
				},
				sorting_strategy = "ascending",
				dynamic_preview_title = true,
				wrap_results = true,
				selection_caret = "  ",
				prompt_prefix = "   ",
				path_display = "truncate",
				preview = {
					treesitter = true,
				},
			},
			pickers = {
				find_files = {
					no_ignore = false,
					hidden = true,
				},
				diagnostics = {
					theme = "cursor",
					layout_config = {
						width = 0.9,
					},
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
				},
				file_browser = {
					theme = "ivy",
				},
			},
		},
		config = function(_, opts)
			local present, telescope = pcall(require, "telescope")
			if not present then
				return
			end
			telescope.setup(opts)
		end,
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
			},
			{
				"<leader>fg",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
			},
			{
				"<leader>fd",
				function()
					require("telescope.builtin").diagnostics()
				end,
			},
		},
	},
}
