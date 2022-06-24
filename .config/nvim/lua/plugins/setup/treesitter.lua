require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"bash",
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"php",
		"scss",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"rasi",
		"comment"
	},
	highlight = {
		enable = true,
	},
  autotag = {
    enable = true,
  }
}
