local awful = require("awful")
local beautiful = require("beautiful")
local awesome = require("awesome")
local client = require("client")
-- local gears = require("gears")
require("awful.autofocus")

awful.mouse.snap.edge_enabled = false

client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end

	--[[ c.shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 5)
	end ]]
end)

-- No border for maximized clients
local function border_adjust(c)
	if c.maximized then -- no borders if only 1 client visible
		c.border_width = 0
	elseif #awful.screen.focused().clients > 1 then
		c.border_width = beautiful.border_width
		c.border_color = beautiful.border_focus
	end
end

client.connect_signal("focus", border_adjust)
client.connect_signal("property::maximized", border_adjust)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)

awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {},
			class = {
				"Sxiv",
			},
			name = {
				"Event Tester", -- xev.
				"Emulator",
				"Picture-in-Picture",
			},
			role = {
				"pop-up",
			},
		},
		properties = { floating = true },
	},

	-- Sticky Clients
	{
		rule_any = { name = { "Picture-in-Picture" } },
		properties = { sticky = true },
	},

	-- onTop Clients
	{
		rule_any = { name = { "Picture-in-Picture", "Emulator" } },
		properties = { ontop = true },
	},
}

-- Sloppy focus
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)
