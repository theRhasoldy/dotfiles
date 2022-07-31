require("colorizer").setup()

require("color-picker").setup({ -- for changing icons & mappings
	["icons"] = { "ﱢ", "" },
	["border"] = "none", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		["U"] = "<Plug>Slider5Decrease",
		["O"] = "<Plug>Slider5Increase",
	},
})
