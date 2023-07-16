local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	filetypes = { "*", "!TelescopePrompt" },
	user_default_options = {
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		names = false, -- "Name" codes like Blue or blue
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = true, -- 0xAARRGGBB hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
		mode = "virtualtext",
		virtualtext = "■",
	},
})
