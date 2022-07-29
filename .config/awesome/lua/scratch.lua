local modules = require("bling")

Term_scratch = modules.module.scratchpad({
	command = "kitty --class spad",
	rule = { instance = "spad" },
	sticky = true,
	autoclose = true,
	floating = true,
	geometry = { x = 360, y = 90, height = 900, width = 1200 },
	reapply = true,
})

Dev_scratch = modules.module.scratchpad({
	command = "kitty --class dev",
	rule = { instance = "dev" },
	sticky = true,
	autoclose = false,
	floating = true,
	geometry = { x = 8, y = 770, height = 300, width = 1900 },
	reapply = true,
})

Spotify_scratch = modules.module.scratchpad({
	command = "spotify",
	rule = { instance = "spotify" },
	sticky = true,
	autoclose = true,
	floating = true,
	geometry = { x = 360, y = 90, height = 900, width = 1200 },
	reapply = true,
})
