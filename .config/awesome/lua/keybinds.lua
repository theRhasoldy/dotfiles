local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")

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

	awful.key({ modkey, ctrl }, "u", function()
		awful.spawn("archlinux-logout")
	end, { description = "Launch logout modal", group = "apps" }),

	-- Spotify {{{
	awful.key({ modkey }, "]", function()
		awful.spawn("sp next")
	end, { description = "Next song", group = "spotify" }),

	awful.key({ modkey }, "[", function()
		awful.spawn("sp prev")
	end, { description = "Previous song", group = "spotify" }),

	awful.key({ modkey }, "\\", function()
		awful.spawn("sp play")
	end, { description = "Play/Pause Music", group = "spotify" }),
	-- }}}

	-- Volume Manipulation {{{
	awful.key({ modkey }, "-", function()
		Volume_widget:toggle()
	end, { description = "Mute volume", group = "volume" }),

	awful.key({ modkey }, "9", function()
		Volume_widget:dec(5)
	end, { description = "Decrement volume", group = "volume" }),

	awful.key({ modkey }, "0", function()
		Volume_widget:inc(5)
	end, { description = "Increment volume", group = "volume" }),
	--}}}

	-- Tags {{{
	awful.key(
		{ modkey },
		"Tab",
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

	awful.key({ modkey }, "n", function()
		awful.client.focus.byidx(1)
	end, { description = "Focus next by index", group = "client" }),

	awful.key({ modkey, shift }, "n", function()
		awful.client.focus.byidx(-1)
	end, { description = "Focus previous by index", group = "client" }),
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

	awful.key({ modkey }, "w", function()
		awful.spawn(string.format("rofi -show window"))
	end, { description = "Launch Rofi window selector", group = "apps" }),

	awful.key({ modkey }, "r", function()
		awful.spawn(string.format("rofi -show run"))
	end, { description = "Launch Rofi run", group = "apps" }),

	awful.key({ modkey }, ".", function()
		awful.spawn(string.format("rofi -modi emoji -show emoji -emoji-format '{emoji} {name}'"))
	end, { description = "Launch Rofi emoji selector", group = "apps" }),

	awful.key({ modkey }, "v", function()
		awful.spawn(string.format("rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"))
	end, { description = "Launch Rofi emoji selector", group = "apps" }),

	awful.key({ modkey }, "c", function()
		awful.spawn.with_shell("bash ~/.config/scripts/colorpick.sh")
	end, { description = "Pick color and copy it to clipboard", group = "apps" }),

	awful.key({ modkey }, "s", function()
		awful.spawn.with_shell("flameshot gui")
	end, { description = "Launch flameshot", group = "apps" }),

	awful.key({ modkey }, "i", function()
		awful.spawn.with_shell("vivaldi-snapshot && rm -rf .pki")
	end, { description = "Launch browser", group = "apps" }),

	awful.key({ modkey }, "o", function()
		awful.spawn.with_shell("obsidian")
	end, { description = "Launch obsidian", group = "apps" }),
	-- }}}

	-- Scratchpads {{{
	awful.key({ modkey }, "a", function()
		Term_scratch:toggle()
	end, { description = "Launch terminal scratchpad", group = "scratchpads" }),

	awful.key({ modkey }, "z", function()
		Pop_scratch:toggle()
	end, { description = "Launch terminal popup", group = "scratchpads" }),

	awful.key({ modkey }, "m", function()
		Spotify_scratch:toggle()
	end, { description = "Launch spotify scratchpad", group = "scratchpads" })
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
		end, { description = "View tag #" .. i, group = "tag" }),

		-- Toggle tag display.
		awful.key({ modkey, ctrl }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "Toggle tag #" .. i, group = "tag" }),

		-- Move client to tag.
		awful.key({ modkey, shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
					local screen = awful.screen.focused()
					local tag2 = screen.tags[i]
					tag2:view_only()
				end
			end
		end, { description = "Move client to tag and focus it" .. i, group = "tag" }),

		-- Toggle tag on focused client.
		awful.key({ modkey, ctrl, shift }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "Move client to tag without focusing it" .. i, group = "tag" })
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

	awful.key({ modkey, ctrl }, "f", function(c)
		c.floating = not c.floating
	end, { description = "Make window floating", group = "client" }),

	awful.key({ modkey }, "`", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, shift }, "`", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" })
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
