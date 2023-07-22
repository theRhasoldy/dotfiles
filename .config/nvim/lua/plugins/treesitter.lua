return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		name = "treesitter-context",
		opts = {
			separator = "",
		},
	},
	opts = {
		ensure_installed = {
			"lua",
			"bash",
			"html",
			"css",
			"scss",
			"astro",
			"javascript",
			"typescript",
			"tsx",
			"json",
			"yaml",
			"rasi",
			"markdown",
			"markdown_inline",
			"vimdoc",
			"diff",
			"gitignore",
			"gitcommit",
			"git_rebase",
			"git_config",
		},
		matchup = {
			enable = true,
		},
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		autotag = { enable = true },
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
		pairs = {
			enable = true,
		},
	},
	config = function()
		require("nvim-treesitter.install").prefer_git = true
	end,
}
