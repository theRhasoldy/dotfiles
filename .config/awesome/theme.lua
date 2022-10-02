local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local beautiful = require("beautiful")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

-- Fonts
theme.font = "Dejavu Sans 7"
theme.notification_font = "Dejavu Sans 8"
theme.taglist_font = "Symbols Nerd Font 7.5"
beautiful.tooltip_font = "Dejavu Sans 7"
beautiful.wibar_font = "Dejavu Sans bold 7"

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
theme.border_focus = "#2F283Acc"
theme.border_Marked = "#2F283Acc"

-- Notification
theme.notification_bg = "#181a21cc"
theme.notification_fg = "#eeeeee"

-- Tooltip
beautiful.tooltip_bg = "#13151c"
beautiful.tooltip_fg = "#eeeeee"

-- Wibox
beautiful.wibar_bg = "#00000000"
beautiful.wibar_fg = "#0E1720"
theme.taglist_fg_focus = "#D98594"
theme.taglist_fg_urgent = "#c37dbf"
theme.taglist_fg_empty = "#0E172045"
theme.taglist_fg_occupied = "#0E1720"

-- Generate taglist squares:
local taglist_square_size = dpi(3)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Define the image to load
theme.layout_fairv = "~/.config/awesome/icons/wibar/tile.png"
theme.layout_tile = "~/.config/awesome/icons/wibar/suitInv.png"
theme.layout_tileleft = "~/.config/awesome/icons/wibar/suit.png"
theme.layout_max = "~/.config/awesome/icons/wibar/full.png"

theme.icon_theme = "/usr/share/icons/Delight-gray"

return theme
