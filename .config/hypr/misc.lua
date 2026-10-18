-- Misc options activated from misc.conf during the Lua migration (2026-10-16).
hl.config({
	misc = {
		always_follow_on_dnd = true,
		enable_swallow = true,
		close_special_on_empty = true,
		on_focus_under_fullscreen = 1, -- was `new_window_takes_over_fullscreen = 1`
		disable_splash_rendering = true, -- was `splash = false`
		vrr = 0,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		disable_autoreload = false,
		disable_hyprland_logo = true,
		session_lock_xray = true,
		session_lock_blur = true,
	},
	debug = {
		vfr = true, -- was `misc.vfr`
	},
	render = {
		direct_scanout = 0, -- was `misc.direct_scanout`; 0 = fixes brief laptop-panel black blinks on fullscreen/OSD plane switches (i915 eDP)
	},
})
