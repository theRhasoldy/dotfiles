local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local bling = require("bling")

tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.tile,
		awful.layout.suit.fair,
		bling.layout.mstab,
		awful.layout.suit.max,
		bling.layout.deck,
	})
end)
-- }}}

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag({ "", "", "", "󱏲", "", "", "" }, s, awful.layout.layouts[1])
end)
