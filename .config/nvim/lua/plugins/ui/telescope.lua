return {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
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
			prompt_prefix = "    ",
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
				cwd_to_path = true,
				hidden = true,
				dir_icon = " ",
				use_fd = true,
				grouped = true,
				initial_mode = "normal",
				theme = "ivy",
				hijack_netrw = true,
			},
		},
	},

	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("noice")
		require("telescope").load_extension("file_browser")
		require("telescope").extensions.file_browser.file_browser()
	end,

	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
		},
		{
			"<leader>n",
			function()
				require("telescope").extensions.file_browser.file_browser()
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
		{
			"<leader>fn",
			function()
				require("telescope").extensions.noice.noice({
					previewer = false,
					initial_mode = "normal",
				})
			end,
		},
	},
}
