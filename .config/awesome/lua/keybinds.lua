local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

globalkeys = gears.table.join(
	-- System {{{
	awful.key({ modkey, "Control" }, "r", awesome.restart,
	{description = "Reload awesome", group = "system"}),

	awful.key({ modkey, "Shift", "Control" }, "q", awesome.quit,
	{description = "Quit awesome", group = "system"}),

	-- Volume Manipulation {{{
	awful.key({ modkey,           }, "]",
	function () volume_widget:inc(5) end,
	{description = "Increment volume", group = "volume"}),

	awful.key({ modkey,           }, "[",
	function () volume_widget:dec(5) end,
	{description = "Decrement volume", group = "volume"}),

	awful.key({ modkey,           }, "\\",
	function () volume_widget:toggle() end,
	{description = "Mute volume", group = "volume"}),
	-- }}}

	-- Tags {{{
	awful.key({ modkey,           }, "`", awful.tag.history.restore,
	{description = "Go to previous tag in history", group = "tag"}),
	-- }}}

	-- Window {{{
	-- Directional Focus {{{
	awful.key({ modkey }, "j",
	function()
		awful.client.focus.global_bydirection("down")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus down", group = "client"}),

	awful.key({ modkey }, "k",
	function()
		awful.client.focus.global_bydirection("up")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus up", group = "client"}),

	awful.key({ modkey }, "h",
	function()
		awful.client.focus.global_bydirection("left")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus left", group = "client"}),

	awful.key({ modkey }, "l",
	function()
		awful.client.focus.global_bydirection("right")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus right", group = "client"}),
	-- }}}
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
	-- }}}

	-- Directional swap {{{
	awful.key({ modkey, "Shift" }, "j",
	function()
		awful.client.swap.global_bydirection("down")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus down", group = "client"}),

	awful.key({ modkey, "Shift" }, "k",
	function()
		awful.client.swap.global_bydirection("up")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus up", group = "client"}),

	awful.key({ modkey, "Shift" }, "h",
	function()
		awful.client.swap.global_bydirection("left")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus left", group = "client"}),

	awful.key({ modkey, "Shift" }, "l",
	function()
		awful.client.swap.global_bydirection("right")
		if client.focus then client.focus:raise() end
	end,
	{description = "Focus right", group = "client"}),
	-- }}}

	awful.key({ modkey, "Shift" }, "f",  awful.client.floating.toggle                     ,
	{description = "Toggle floating", group = "client"}),

	-- }}}

	-- Apps {{{
	awful.key({ modkey,           }, "Return",
	function () awful.spawn( terminal ) end,
	{description = "Launch Terminal", group = "apps"}),

	awful.key({ modkey,           }, "e",
	function () awful.spawn( "thunar" ) end,
	{description = "Launch file manager", group = "apps"}),

	awful.key({ modkey,           }, "space",
	function () awful.spawn(string.format("rofi -show drun")) end,
	{description = "Launch Rofi app selector", group = "apps"}),

	awful.key({ modkey,           }, "r",
	function () awful.spawn(string.format("rofi -show run")) end,
	{description = "Launch Rofi run", group = "apps"}),

	awful.key({ modkey,           }, ".",
	function () awful.spawn(string.format("rofi -show emoji")) end,
	{description = "Launch Rofi emoji selector", group = "apps"}),

	awful.key({ modkey,           }, "c",
	function () awful.spawn.with_shell("colorpicker --one-shot --short | xclip -selection clipboard") end,
	{description = "Pick color and copy it to clipboard", group = "apps"})
	-- }}}
)

-- Change Tabs {{{
for i = 1, 9 do
	globalkeys = gears.table.join(globalkeys,
	-- View tag only.
	awful.key({ modkey },"#" .. i + 9,
	function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			tag:view_only()
		end
	end,
	{description = "view tag #"..i, group = "tag"}),

	-- Toggle tag display.
	awful.key({ modkey, "Control" }, "#" .. i + 9,
	function ()
		local screen = awful.screen.focused()
		local tag = screen.tags[i]
		if tag then
			awful.tag.viewtoggle(tag)
		end
	end,
	{description = "toggle tag #" .. i, group = "tag"}),

	-- Move client to tag.
	awful.key({ modkey, "Shift" }, "#" .. i + 9,
	function ()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:move_to_tag(tag)
			end
		end
	end,
	{description = "move focused client to tag #"..i, group = "tag"}),

	-- Toggle tag on focused client.
	awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
	function ()
		if client.focus then
			local tag = client.focus.screen.tags[i]
			if tag then
				client.focus:toggle_tag(tag)
			end
		end
	end,
	{description = "toggle focused client on tag #" .. i, group = "tag"})
	)
end
-- }}}

-- Client {{{
clientkeys = gears.table.join(
	awful.key({ modkey, "Control"   }, "q",
	function (c) c:kill() end,
	{description = "Close client with focus", group = "client"})
)
-- }}}

-- Buttons {{{
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
-- {}

-- Set keys
root.keys(globalkeys)
-- }}}
