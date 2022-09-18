local status, illuminate = pcall(require, "illuminate")
if not status then
	return
end

illuminate.configure({
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	filetype_overrides = {},
	filetypes_denylist = {
		"TelescopePrompt",
	},
	filetypes_allowlist = {},
	modes_denylist = {},
	modes_allowlist = {},
	providers_regex_syntax_denylist = {},
	providers_regex_syntax_allowlist = {},
	under_cursor = true,
})
