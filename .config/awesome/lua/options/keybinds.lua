local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

local terminal = "kitty"
local config = os.getenv("XDG_CONFIG_HOME")

-- Modifiers {{{
local mod = "Mod4"
local ctrl = "Control"
local shift = "Shift"
-- }}}

local global_keybinds = awful.keyboard.append_global_keybindings
local client_keybinds = awful.keyboard.append_client_keybindings

local global_mouse = awful.mouse.append_global_mousebindings
local client_mouse = awful.mouse.append_client_mousebindings

local key = awful.key
local spawn = awful.spawn

-- {{{ Key bindings
global_keybinds({
	-- System {{{
	key({ mod }, "?", hotkeys_popup.show_help, { description = "Show help", group = "System" }),
	key({ mod, ctrl }, "r", awesome.restart, { description = "Reload awesome", group = "System" }),
	key({ mod, ctrl, shift }, "q", awesome.quit, { description = "Quit awesome", group = "System" }),

	-- Volume
	key({ mod }, "9", function()
		awful.spawn.with_shell("amixer set Master 5%-")
	end, { description = "Decrease Volume", group = "Volume" }),

	key({ mod }, "0", function()
		awful.spawn.with_shell("amixer set Master 5%+")
	end, { description = "Increase Volume", group = "Volume" }),

	key({ mod }, "-", function()
		awful.spawn.with_shell(
			'amixer set Master toggle; if amixer get Master | grep -Fq "[off]"; then volnoti-show -m; else volnoti-show $(amixer get Master | grep -Po "[0-9]+(?=%)" | tail -1); fi'
		)
	end, { description = "Mute", group = "Volume" }),

	-- Spotify
	key({ mod }, "\\", function()
		awful.spawn("sp play")
	end, { description = "Play/pause Spotify", group = "Media" }),

	key({ mod }, "]", function()
		awful.spawn("sp next")
	end, { description = "Play/pause Spotify", group = "Media" }),

	key({ mod }, "[", function()
		awful.spawn("sp prev")
	end, { description = "Play/pause Spotify", group = "Media" }),
	-- }}}

	-- Taglists {{{
	key({ mod }, "Tab", awful.tag.history.restore, { description = "Go to previous tag in history", group = "Tag" }),
	-- }}}

	awful.key({ mod }, "a", function()
		Spad:toggle()
	end, { description = "Toggle Spad", group = "Scratchpads" }),

	awful.key({ mod }, "z", function()
		Pop:toggle()
	end, { description = "Toggle Pop", group = "Scratchpads" }),

	awful.key({ mod }, "m", function()
		Spot:toggle()
	end, { description = "Toggle Spotify scratchpad", group = "Scratchpads" }),

	-- Clients {{{
	-- Focus
	key({ mod }, "j", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus down", group = "Client" }),

	key({ mod }, "k", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus up", group = "Client" }),

	key({ mod }, "h", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus left", group = "Client" }),

	key({ mod }, "l", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Focus right", group = "Client" }),

	key({ mod }, "x", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "Go back", group = "Client" }),

	key({ mod }, "n", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	-- }}}

	-- Resizing
	awful.key({ mod, ctrl }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ mod, ctrl }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),

	-- Directional swap
	key({ mod, shift }, "j", function()
		awful.client.swap.global_bydirection("up")
	end, { description = "Swap up", group = "client" }),

	key({ mod, shift }, "k", function()
		awful.client.swap.global_bydirection("down")
	end, { description = "Swap down", group = "client" }),

	key({ mod, shift }, "h", function()
		awful.client.swap.global_bydirection("left")
	end, { description = "Swap left", group = "client" }),

	key({ mod, shift }, "l", function()
		awful.client.swap.global_bydirection("right")
	end, { description = "Swap right", group = "client" }),
	-- }}}

	-- Layout manipulation
	key({ mod, shift }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),

	key({ mod, shift }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),

	key({ mod, ctrl }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),

	key({ mod, ctrl }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	key({ mod }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	key({ mod }, "x", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Launchers {{{
	key({ mod }, "Return", function()
		awful.spawn(terminal)
	end, { description = "Open terminal", group = "Launchers" }),

	-- Rofi
	key({ mod, ctrl }, "u", function()
		awful.spawn.with_shell("bash " .. config .. "/rofi/powermenu/powermenu.sh")
	end, { description = "Launch Rofi powermenu", group = "Launchers" }),

	key({ mod }, "r", function()
		awful.spawn("rofi -config " .. config .. "/rofi/app.rasi -show drun")
	end, { description = "Open Rofi application launcher", group = "Launchers" }),

	key({ mod }, "w", function()
		awful.spawn("rofi -config " .. config .. "/rofi/window.rasi -show window")
	end, { description = "Launch Rofi window selector", group = "Launchers" }),

	key({ mod }, ".", function()
		awful.spawn("rofi -config " .. config .. "/rofi/emoji.rasi -modi emoji -show emoji -emoji-format '{emoji}'")
	end, { description = "Launch Rofi emoji selector", group = "Launchers" }),

	key({ mod }, "v", function()
		awful.spawn(
			"rofi -config "
			.. config
			.. "/rofi/clipboard.rasi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"
		)
	end, { description = "Launch Rofi clipboard selector", group = "Launchers" }),
	-- }}}

	-- Applications {{{
	key({ mod }, "i", function()
		awful.spawn.with_shell("vivaldi-stable && rm -rf ~/.pki")
	end, { description = "Launch Browser", group = "Applications" }),

	key({ mod }, "s", function()
		awful.spawn.with_shell("flameshot gui")
	end, { description = "Take a screenshot", group = "Applications" }),

	key({ mod }, "c", function()
		awful.spawn.with_shell("colorpick.sh")
	end, { description = "Pick Color", group = "Applications" }),
	-- }}}
})

-- This should map on the top row of your keyboard, usually 1 to 9.
global_keybinds({

	key({ mod }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	key({ mod }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),

	key({
		modifiers = { mod },
		keygroup = "numrow",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
			end
		end,
		description = "Switch tag",
		group = "tag",
	}),

	key({
		modifiers = { mod, "Control" },
		keygroup = "numrow",
		group = "tag",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
		description = "Toggle tag",
	}),

	key({
		modifiers = { mod, "Shift" },
		keygroup = "numrow",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
					local screen = awful.screen.focused()
					local tag2 = screen.tags[index]
					tag2:view_only()
				end
			end
		end,
		description = "Move focused client to tag and switch to the tag",
	}),

	key({
		modifiers = { mod, "Control", "Shift" },
		keygroup = "numrow",
		group = "tag",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
		description = "Just move focused client to tag",
	}),
})

-- Client Manipulation {{{
client.connect_signal("request::default_keybindings", function()
	client_keybinds({
		key({ mod, ctrl }, "w", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "Toggle client fullscreen", group = "Client" }),

		key({ mod, ctrl }, "q", function(c)
			c:kill()
		end, { description = "Close current client", group = "Client" }),
		key(
			{ mod, ctrl },
			"f",
			awful.client.floating.toggle,
			{ description = "Toggle client floating", group = "Client" }
		),
		key({ mod, ctrl }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "Toggle client keep on top", group = "Client" }),

		key({ mod, ctrl }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "Maximize client", group = "Client" }),
	})
end)
-- }}}

-- Mouse {{{
global_mouse({
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})
-- }}}

-- Mouse Client Manipulation {{{
client.connect_signal("request::default_mousebindings", function()
	client_mouse({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ mod }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ mod }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)
-- }}}
