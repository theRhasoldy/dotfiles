local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local beautiful = require("beautiful")

local theme = {}

--Main UI {{{
theme.font = "Ubuntu Bold 8"
theme.bg_normal = "#141313"
theme.bg_focus = "#141313"
theme.fg_normal = "#eeeeee"
theme.fg_focus = "#eeeeee"
theme.fg_urgent = "#eeeeee"
theme.fg_minimize = "#eeeeee"
-- }}}

-- Window
theme.useless_gap = dpi(3)

theme.border_width = dpi(0)
theme.border_normal = "#141313"
--[[ theme.border_focus = "#2f283acc"
theme.border_marked = "#2f283acc" ]]
-- }}}

-- Notification
theme.notification_info_font = "Ubuntu bold 8"
theme.notification_header_font = "Ubuntu bold 9"
theme.notification_font = "Ubuntu 9"
theme.notification_bg = "#2E221C42"
theme.notification_fg = "#eeeeee"
-- }}}

-- Tooltip
beautiful.tooltip_font = "Ubuntu 8"
beautiful.tooltip_bg = "#2E221C42"
beautiful.tooltip_fg = "#eeeeee"
-- }}}

-- Wibox
beautiful.wibar_font = "Ubuntu semi-bold 8"
beautiful.wibar_panel_bg = "#00000000"
beautiful.wibar_bg = "#2E221C42"
beautiful.wibar_fg = "#eeeeee"
-- }}}

-- Taglist
theme.taglist_font = "Symbols Nerd Font 7.5"
local taglist_square_size = dpi(3)
theme.taglist_fg_occupied = "#ffbdbf"
theme.taglist_fg_focus = "#e5759b"
theme.taglist_fg_urgent = "#cda9e0"
theme.taglist_fg_volatile = "#cda9e0"
theme.taglist_fg_empty = "#FFD5CD20"
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.taglist_fg_empty)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.taglist_fg_empty)
-- }}}

-- Define the image to load
theme.layout_fairv = "~/.config/awesome/icons/wibar/tile.png"
theme.layout_tile = "~/.config/awesome/icons/wibar/suitInv.png"
theme.layout_max = "~/.config/awesome/icons/wibar/full.png"
-- }}}

theme.icon_theme = "/usr/share/icons/Fluent-grey-dark/"

return theme
