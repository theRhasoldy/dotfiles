local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.init_lsp_saga({
	border_style = "rounded",
	diagnostic_header = { "  ", "  ", "  ", " " },
	code_action_icon = " ",
	server_filetype_map = {},
	code_action_lightbulb = {
		enable = false,
	},
	rename_action_quit = "<Escape>",
	code_action_keys = {
		quit = "<Escape>",
		exec = "<CR>",
	},
})
