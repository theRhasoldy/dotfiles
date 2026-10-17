-- Monitors, misc display servers, env (was display.conf)
hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x640", scale = 1, bitdepth = 10 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "1920x0", scale = 1, bitdepth = 10 })

hl.config({
	xwayland = {
		force_zero_scaling = true,
		use_nearest_neighbor = true,
	},
	opengl = {
		nvidia_anti_flicker = false,
	},
	cursor = {
		no_hardware_cursors = 0, -- was `false`
		enable_hyprcursor = true,
		sync_gsettings_theme = true,
		warp_on_change_workspace = 1,
		warp_on_toggle_special = 1,
	},
})

hl.env("XCURSOR_THEME", "BreezeX-RosePineDawn")
hl.env("XCURSOR_SIZE", "16")

hl.env("GDK_SCALE", "1")

hl.env("LIBVA_DRIVER_NAME", "iHD")
