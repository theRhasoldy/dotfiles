local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local naughty = require("naughty")
local gears = require("gears")

-- Default config
naughty.config.spacing = dpi(10)
naughty.config.padding = dpi(50)
naughty.config.defaults.margin = dpi(10)
naughty.config.defaults.border_width = beautiful.border_width
naughty.config.defaults.border_color = beautiful.border_normal
naughty.config.defaults.max_width = dpi(350)
-- naughty.config.defaults.max_height = dpi(20)
naughty.config.defaults.icon_size = 64
naughty.config.defaults.shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, dpi(10))
end

-- Presets
naughty.config.presets.low.timeout = 5

naughty.config.presets.normal.timeout = 6

naughty.config.presets.critical.timeout = 12
naughty.config.presets.critical.bg = beautiful.highlight
naughty.config.presets.critical.fg = beautiful.bg_normal
