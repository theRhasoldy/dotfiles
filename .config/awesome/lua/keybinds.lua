local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")
local client = require("client")
local awesome = require("awesome")

Terminal = "kitty"

require("lua.scratch")

local modkey = "Mod4"
local alt = "Mod1"
local ctrl = "Control"
local shift = "Shift"

local globalkeys = gears.table.join(

	-- System {{{

	awful.key({ modkey, ctrl }, "r", awesome.restart, { description = "Reload awesome", group = "system" }),

	awful.key({ modkey, shift, ctrl }, "q", awesome.quit, { description = "Quit awesome", group = "system" }),

	-- Volume Manipulation {{{
	awful.key({ modkey }, "]", function()
		Volume_widget:inc(5)
	end, { description = "Increment volume", group = "volume" }),

	awful.key({ modkey }, "[", function()
		Volume_widget:dec(5)
	end, { description = "Decrement volume", group = "volume" }),

	awful.key({ modkey }, "\\", function()
		Volume_widget:toggle()
	end, { description = "Mute volume", group = "volume" }),
	-- }}}

	-- Tags {{{
	awful.key(
		{ modkey },
		"`",
		awful.tag.history.restore,
		{ description = "Go to previous tag in history", group = "tag" }
	),
	-- }}}

	-- Window {{{
	-- Directional Focus {{{
	awful.key({ modkey }, "j", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus down", group = "client" }),

	awful.key({ modkey }, "k", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus up", group = "client" }),

	awful.key({ modkey }, "h", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus left", group = "client" }),

	awful.key({ modkey }, "l", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus right", group = "client" }),
	-- }}}
	awful.key({ modkey }, "x", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Go back", group = "client" }),
	-- }}}

	-- Directional swap {{{
	awful.key({ modkey, shift }, "j", function()
		awful.client.swap.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus down", group = "client" }),

	awful.key({ modkey, shift }, "k", function()
		awful.client.swap.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus up", group = "client" }),

	awful.key({ modkey, shift }, "h", function()
		awful.client.swap.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus left", group = "client" }),

	awful.key({ modkey, shift }, "l", function()
		awful.client.swap.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus right", group = "client" }),

	awful.key(
		{ modkey, ctrl },
		"f",
		awful.client.floating.toggle,
		{ description = "Toggle floating", group = "client" }
	),
	-- }}}

	-- Apps {{{
	awful.key({ modkey, shift }, "/", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),

	awful.key({ modkey }, "Return", function()
		awful.spawn(Terminal)
	end, { description = "Launch Terminal", group = "apps" }),

	awful.key({ modkey }, "e", function()
		awful.spawn("thunar")
	end, { description = "Launch file manager", group = "apps" }),

	awful.key({ modkey }, "space", function()
		awful.spawn(string.format("rofi -show drun"))
	end, { description = "Launch Rofi app selector", group = "apps" }),

	awful.key({ modkey }, "r", function()
		awful.spawn(string.format("rofi -show run"))
	end, { description = "Launch Rofi run", group = "apps" }),

	awful.key({ modkey }, ".", function()
		awful.spawn(string.format("rofi -show emoji"))
	end, { description = "Launch Rofi emoji selector", group = "apps" }),

	awful.key({ modkey }, "c", function()
		awful.spawn.with_shell("colorpicker --one-shot --short | xclip -selection clipboard")
	end, { description = "Pick color and copy it to clipboard", group = "apps" }),

	awful.key({ modkey }, "s", function()
		awful.spawn.with_shell("flameshot gui")
	end, { description = "Launch flameshot", group = "apps" }),

	awful.key({ modkey }, "i", function()
		awful.spawn.with_shell("firefox")
	end, { description = "Launch firefox", group = "apps" }),
	-- }}}

	-- Scratchpads {{{
	awful.key({ modkey }, "a", function()
		Term_scratch:toggle()
	end, { description = "Launch terminal scratchpad", group = "scratchpads" }),

	awful.key({ modkey }, "m", function()
		Spotify_scratch:toggle()
	end, { description = "Launch spotify scratchpad", group = "scratchpads" }),

	awful.key({ modkey }, "d", function()
		Dev_scratch:toggle()
	end, { description = "Launch development terminal", group = "scratchpads" })
	-- }}}
)

-- Change Tabs {{{
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),

		-- Toggle tag display.
		awful.key({ modkey, ctrl }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),

		-- Move client to tag.
		awful.key({ modkey, shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),

		-- Toggle tag on focused client.
		awful.key({ modkey, ctrl, shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end
-- }}}

-- Client {{{
clientkeys = gears.table.join(
	awful.key({ modkey, ctrl }, "q", function(c)
		c:kill()
	end, { description = "Close client with focus", group = "client" }),

	awful.key({ modkey, ctrl }, "t", function(c)
		c.sticky = not c.sticky
	end, { description = "Make window sticky", group = "client" }),

	awful.key({ modkey }, "Tab", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, shift }, "Tab", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	-- Scratchpads {{{
	awful.key({ modkey }, "a", function()
		Term_scratch:toggle()
	end, { description = "Launch terminal scratchpad", group = "scratchpads" }),

	awful.key({ modkey }, "m", function()
		Spotify_scratch:toggle()
	end, { description = "Launch spotify scratchpad", group = "scratchpads" }),

	awful.key({ modkey }, "d", function()
		Dev_scratch:toggle()
	end, { description = "Launch development terminal", group = "scratchpads" })
)
-- }}}

-- Buttons {{{
clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)
-- {}

-- Set keys
root.keys(globalkeys)
-- }}}
