-- Decorations (was decorations.conf)
hl.config({
	decoration = {
		rounding = 10,
		rounding_power = 2.5,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		dim_inactive = true,
		dim_strength = 0.15,

		shadow = {
			-- hyprglass force-enables this while glass is active; these values give it the soft macOS look
			enabled = false,
			range = 30,
			render_power = 3,
			color = 0x66000000,
		},

		blur = {
			brightness = 0.5,
			new_optimizations = true,
			popups = true,
			enabled = true,
			size = 8,
			passes = 3,
			ignore_opacity = true,
			xray = false,
			popups_ignorealpha = 0.5,
			special = true,
		},
	},
})
