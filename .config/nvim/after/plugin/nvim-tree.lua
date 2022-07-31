require("nvim-tree").setup({ -- BEGIN_DEFAULT_OPTS
	create_in_closed_folder = true,
	disable_netrw = false,
	open_on_setup = true,
	update_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	view = {
		adaptive_size = true,
		hide_root_folder = false,
		side = "right",
		preserve_window_proportions = true,
		signcolumn = "yes",
	},
	renderer = {
		highlight_git = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = " ",
					open = " ",
					empty = " ",
					empty_open = " ",
					symlink = " ",
					symlink_open = " ",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 400,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "telescope" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
})
