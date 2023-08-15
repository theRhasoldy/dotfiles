return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
				require("telescope").load_extension("refactoring")
			end,
		},
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"ThePrimeagen/refactoring.nvim",
		{
			"luckasRanarison/nvim-devdocs",
			opts = {
				telescope_alt = {
					theme = "dropdown",
				},
				float_win = { -- passed to nvim_open_win(), see :h api-floatwin
					relative = "editor",
					height = 50,
					width = 150,
					border = "single",
				},
				ensure_installed = { "html", "css", "javascript", "typescript" },
			},
		},
	},
	opts = {
		defaults = {
			winblend = 10,
			dynamic_preview_title = true,
			path_display = { "smart" },
			layout_strategy = "vertical",
			prompt_prefix = "    ",
			selection_caret = "  ",

			-- Optimizations
			cache_picker = true,
			file_ignore_patterns = { "node_modules", ".git/" },

			preview = {
				filesize_limit = 1,
				treesitter = true,
			},
			mappings = {
				i = {
					["<C-q>"] = "close",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
				n = {
					["q"] = "close",
				},
			},
		},

		builtin = {
			find_files = {
				find_command = { "rg", "--files" },
				hidden = true,
			},
			diagnostics = {
				theme = "ivy",
			},
		},

		extensions = {
			fzf = {
				override_generic_sorter = true,
				override_file_sorter = true,
			},
			live_grep_args = {
				find_command = { "rg", "--files" },
				auto_quoting = true,
			},
			refactors = {
				initial_mode = "normal",
				theme = "ivy",
			},
			file_browser = {
				initial_mode = "normal",
				hijack_netrw = true,
				cwd_to_path = true,
				hidden = true,
				path = "%:p:h",
				dir_icon = "",
				grouped = true,
				theme = "ivy",
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Search files",
		},
		{
			"<leader>n",
			function()
				require("telescope").extensions.file_browser.file_browser()
			end,
			desc = "Open file browser",
		},
		{
			"<leader>fg",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({
					previewer = true,
				})
			end,
			desc = "Search keyword",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Show diagnostics",
		},
		{
			"<leader>fn",
			function()
				require("telescope").extensions.noice.noice({
					initial_mode = "normal",
				})
			end,
			desc = "Show notifications",
		},
		{
			"<leader>fq",
			"<cmd>DevdocsOpenFloat<CR>",
			desc = "Open floating window of documentation",
		},
		{
			"gs",
			mode = { "n", "x" },
			function()
				require("telescope").extensions.refactoring.refactors()
			end,
			desc = "Refactor code",
		},
	},
}
