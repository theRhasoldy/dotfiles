local present, telescope = pcall(require, "telescope")
if not present then
	return
end

vim.g.theme_switcher_loaded = true

require("telescope").load_extension("harpoon")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--smart-case",
			"--column",
		},
		prompt_prefix = "    ",
		selection_caret = " ",
		entry_prefix = " ",
		file_ignore_patterns = { "node_modules" },
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		theme = "dropdown",
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-j>"] = require("telescope.actions").move_selection_next,
			},
		},
	},
	pickers = {
		diagnostics = {
			initial_mode = "normal",
			theme = "ivy",
		},
		find_files = {
			no_ignore = false,
			hidden = true,
		},
		lsp_references = {
			initial_mode = "normal",
			theme = "ivy",
			-- layout_strategy = "horizontal",
			layout_config = { width = 0.95 },
		},
	},

	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous,
					["<C-j>"] = require("telescope.actions").move_selection_next,
				},
			},
		},
	},
	extensions_list = { "themes", "terms", "live_grep_args", "harpoon" },
})

-- load extensions
pcall(function()
	for _, ext in ipairs(telescope.setup.extensions_list) do
		telescope.load_extension(ext)
	end
end)
