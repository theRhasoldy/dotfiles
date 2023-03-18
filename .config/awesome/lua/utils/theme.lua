local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local font = "Ubuntu Bold 8"

local colors = {
  foreground = "#e4e0f9",
  background = "#2c2a39",
  primary = "#ffbdbf",
  secoondary = "#e5759b",
  tertiary = "#cda9e0",
  faded = "#625E7799",
}

local theme = {
  wallpaper = "/usr/share/backgrounds/background.jpg",
  font = "Ubuntu semi-bold 9",
  useless_gap = dpi(3),
  -- Colors
  fg_normal = colors.foreground,
  bg_normal = colors.background,
  taglist_font = font,
  taglist_fg_occupied = colors.primary,
  taglist_fg_focus = colors.secoondary,
  taglist_fg_urgent = colors.tertiary,
  taglist_fg_volatile = colors.tertiary,
  taglist_fg_empty = colors.faded,
  systray_icon_spacing = dpi(8),
}

return theme
