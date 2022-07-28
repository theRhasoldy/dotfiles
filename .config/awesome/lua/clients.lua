local awful = require("awful")
local beautiful = require("beautiful")
local awesome = require("awesome")
local client = require("client")
require("awful.autofocus")

awful.mouse.snap.edge_enabled = false

client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- No border for maximized clients
function border_adjust(c)
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
			instance = {
				"copyq", -- Includes session name in class.
			},
			class = {
				"Sxiv",
			},
			name = {
				"Event Tester", -- xev.
				"Emulator",
			},
			role = {
				"pop-up",
			},
		},
		properties = { floating = true },
	},

	{
		rule = { name = "Picture-in-Picture" },
		properties = { floating = true, sticky = true },
	},
}

-- Enable on click raise
client.connect_signal("mouse::click", function(c)
	c:emit_signal("request::activate", "mouse_click", { raise = true })
end)

-- Sloppy focus
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)
