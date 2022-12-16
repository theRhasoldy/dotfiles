local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local beautiful = require("beautiful")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- Fonts
theme.font = "Ubuntu Bold 9"
theme.notification_font = "Ubuntu Bold 9"
theme.taglist_font = "Symbols Nerd Font 7.5"
beautiful.tooltip_font = "Ubuntu 9"
-- beautiful.wibar_font = "Dejavu Sans bold 8"
beautiful.wibar_font = "Ubuntu Bold 9"

--Main UI
theme.bg_normal = "#0F1115"
theme.bg_focus = "#13151c"

theme.fg_normal = "#eeeeee"
theme.fg_focus = "#eeeeee"
theme.fg_urgent = "#eeeeee"
theme.fg_minimize = "#eeeeee"

-- Window
theme.useless_gap = dpi(2.5)

theme.border_width = dpi(2)
theme.border_normal = "#13151c"
theme.border_focus = "#2f283acc"
theme.border_marked = "#2f283acc"

-- Notification
theme.notification_bg = "#894E72CC"
theme.notification_fg = "#cd94b7"

-- Tooltip
beautiful.tooltip_bg = "#682d51cc"
beautiful.tooltip_fg = "#cd94b7"

-- Wibox
beautiful.wibar_panel_bg = "#894E72CC"
beautiful.wibar_bg = "#00000000"
beautiful.wibar_fg = "#cd94b7"
theme.taglist_fg_urgent = "#cda9e0"
theme.taglist_fg_focus = "#e5759b"
theme.taglist_fg_empty = "#cd94b755"
theme.taglist_fg_occupied = "#cd94b7"

-- Generate taglist squares:
local taglist_square_size = dpi(3)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Define the image to load
theme.layout_fairv = "~/.config/awesome/icons/wibar/tile.png"
theme.layout_tile = "~/.config/awesome/icons/wibar/suitInv.png"
theme.layout_max = "~/.config/awesome/icons/wibar/full.png"

theme.icon_theme = "/usr/share/icons/Delight-gray"

return theme
