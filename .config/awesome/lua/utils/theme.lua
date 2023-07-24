local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local font = "SF Pro 9"
local bold_font = "SF Pro bold 9"

local colors = {
	foreground = "#eeeeee",
	-- foreground = "#eeeeee",
	-- background = "#2c2a39",
	background = "#121212",
	-- background = "#232323",
	pumpkin = "#ffbdbf",
	plump = "#e5759b",
	violet = "#cda9e0",
	-- faded = "#625E77",
	faded = "#626262",
}

local theme = {
	wallpaper = "~/Downloads/background.jpg",
	font = font,
	useless_gap = dpi(1.5),
	-- Colors
	fg_normal = colors.foreground,
	bg_normal = colors.background .. "ee",
	-- wibar
	icon_color_1 = colors.violet,
	icon_color_2 = colors.pumpkin,
	icon_color_3 = colors.plump,
	-- Tags
	taglist_font = font,
	taglist_fg_occupied = colors.pumpkin,
	taglist_fg_focus = colors.plump,
	taglist_fg_urgent = colors.violet,
	taglist_fg_volatile = colors.violet,
	taglist_fg_empty = colors.faded .. "99",
	-- Wibar
	systray_icon_spacing = dpi(8),
	-- Notifications
	notification_bg = colors.background .. "99",
	notification_header_font = bold_font,
	notification_border_color = colors.background,
}

return theme
