local status, wilder = pcall(require, "wilder")
if not status then
	return
end

wilder.setup({
	modes = { ":", "/", "?" },
	-- enable_cmdline_enter = 0,
	next_key = "<C-j>",
	previous_key = "<C-k>",
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(
		wilder.popupmenu_border_theme({
			highlights = {
				border = "Border", -- highlight to use for the border
				accent = "WilderAccentSel",
				selected_accent = "WilderAccent",
			},
			border = "rounded",

			highlighter = wilder.basic_highlighter(),
			left = { " ", wilder.popupmenu_devicons() },
			right = { " ", wilder.popupmenu_scrollbar({
				thumb_hl = "Border",
			}) },
		}),
		wilder.wildmenu_renderer({
			highlighter = wilder.basic_highlighter(),
		}),
		wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline())
	)
)
