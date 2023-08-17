return {
	{
		"NvChad/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			filetypes = {
				"*",
				cmp_docs = { always_update = true },
				cmp_menu = { always_update = true },
				css = {
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				},
				scss = {
					css = true,                               -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true,                            -- Enable all CSS *functions*: rgb_fn, hsl_fn
					sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
				},
			},
			user_default_options = {
				RGB = true,       -- #RGB hex codes
				RRGGBB = true,    -- #RRGGBB hex codes
				names = true,     -- "Name" codes like Blue or blue
				RRGGBBAA = true,  -- #RRGGBBAA hex codes
				AARRGGBB = true,  -- 0xAARRGGBB hex codes
				rgb_fn = true,    -- CSS rgb() or rgba() functions
				hsl_fn = true,    -- CSS hsl() and hsla() functions
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "virtualtext", -- Set the display mode.
				tailwind = true,  -- Enable tailwind colors
				virtualtext = "■",
			},
			-- all the sub-options of filetypes apply to buftypes
			buftypes = {},
		},
	},
}
