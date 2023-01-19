local awful = require("awful")
local beautiful = require("beautiful")
--[[ local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi ]]

require("awful.autofocus")
require("lua.wibar")

-- Disable snapping
awful.mouse.snap.edge_enabled = false
awful.mouse.snap.client_enabled = false

--[[ local border_radius = dpi(13)

local function rounded_borders(c)
	if c.fullscreen then
		c.shape = function(cr, w, h)
			gears.shape.rectangle(cr, w, h)
		end
	else
		c.shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, border_radius)
		end
	end
end ]]

client.connect_signal("manage", function(c)
	-- Priotrize master client when splitting
	if not awesome.startup then
		awful.client.setslave(c)
	end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Hide wibox full fullscreen clients
local function adjust(c)
	if c.fullscreen then
		mouse.screen.mywibox.visible = false
	else
		mouse.screen.mywibox.visible = true
	end
	-- No border for maximized clients
	--[[
	if c.maximized then -- no borders if only 1 client visible
		c.border_width = 0
	elseif #awful.screen.focused().clients > 1 then
		c.border_width = beautiful.border_width
		c.border_color = beautiful.border_focus
	end ]]
end

client.connect_signal("focus", adjust)
client.connect_signal("property::maximized", adjust)
client.connect_signal("property::fullscreen", adjust)
client.connect_signal("unfocus", function(c)
	-- c.border_color = beautiful.border_normal
	mouse.screen.mywibox.visible = true
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
				"Arandr",
				"pop",
				"spad",
				"Spotify",
			},
			name = {
				"Event Tester", -- xev.
				"Emulator",
				"Picture in picture",
			},
			role = {
				"pop-up",
				"AlarmWindow",
				"ConfigManager",
			},
		},
		properties = { floating = true },
	},

	-- Sticky Clients
	{
		rule_any = { name = { "Picture in picture" }, class = { "pop", "spad", "Spotify" } },
		properties = { sticky = true },
	},

	-- onTop Clients
	{
		rule_any = { name = { "Picture in picture", "Emulator" }, class = { "pop", "spad", "Spotify" } },
		properties = { ontop = true },
	},

	-- not maximized Clients
	{
		rule_any = { class = { "Thunar", "Inkscape", "Blender" }, role = { "browser" } },
		properties = { maximized = false },
	},

	-- not fullscreen Clients
	{
		rule_any = { class = { "league of legends.exe" } },
		properties = { fullscreen = false },
	},

	-- Client tag rules
	{ rule = { role = "browser" }, properties = { screen = 1, tag = "" } },
	{ rule = { class = "obsidian" }, properties = { screen = 1, tag = "" } },
	{ rule = { class = "figma-linux" }, properties = { screen = 1, tag = "" } },
	{ rule = { class = "Inkscape" }, properties = { screen = 1, tag = "" } },
	{ rule = { class = "Blender" }, properties = { screen = 1, tag = "" } },
	{ rule = { name = "GNU Image Manipulation Program" }, properties = { screen = 1, tag = "" } },
	{ rule = { name = "Todoist*" }, properties = { screen = 1, tag = "" } },
}

-- Sloppy focus
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
