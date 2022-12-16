local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local space = dpi(20)

-- Seperator {{{
local sep = wibox.widget({
	widget = wibox.widget.seperator,
	forced_width = dpi(10),
})
-- }}}

local uptime_text = wibox.widget.textbox()
awful.widget.watch("upt", 60, function(_, stdout) -- fetchutils https://github.com/kiedtl/fetchutils
	-- Remove trailing whitespaces
	local out = stdout:gsub("^%s*(.-)%s*$", "%1")
	uptime_text.text = out
end)

local uptime_widget = wibox.widget({
	{
		font = beautiful.wibar_font,
		widget = uptime_text,
	},
	layout = wibox.layout.margin,
})

-- Layout box {{{
local layoutbox = awful.widget.layoutbox(s)
-- }}}

-- Time Panel {{{
local timepanel = wibox.widget({
	type = "normal",
	{
		layout = wibox.layout.margin,
		left = 15,
		right = 15,
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = space,
			{
				format = "%a %b %d",
				font = beautiful.wibar_font,
				widget = wibox.widget.textclock,
			},
			{
				widget = wibox.widget.textclock,
				format = "%R",
				font = beautiful.wibar_font,
			},
			uptime_text,
			layoutbox,
		},
	},
	bg = beautiful.wibar_panel_bg,
	shape = gears.shape.rounded_bar,
	widget = wibox.container.background,
})
-- }}}

-- Volume {{{
Volume_widget = require("widgets.volume-widget.volume")
-- }}}

-- Spotify {{{
local spotify_widget = require("widgets.spotify-widget.spotify")
-- }}}

-- Media Panel {{{
local mediapanel = wibox.widget({
	type = "normal",
	{
		layout = wibox.layout.margin,
		left = 15,
		right = 15,
		{
			layout = wibox.layout.fixed.horizontal,
			forced_height = 22,
			spacing = space,
			spotify_widget({
				font = beautiful.wibar_font,
				dim_when_paused = true,
				dim_opacity = 0.45,
				max_length = 100,
				timeout = 0,
			}),
			Volume_widget({
				widget_type = "icon",
				device = "pipewire",
			}),
		},
	},
	bg = beautiful.wibar_panel_bg,
	shape = gears.shape.rounded_bar,
	widget = wibox.container.background,
})
-- }}}

awful.screen.connect_for_each_screen(function(s)
	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		widget_template = {
			widget = wibox.container.background,
			forced_width = 34.5,
			forced_height = 30,
			{
				layout = wibox.layout.flex.horizontal,
				{
					id = "text_role",
					widget = wibox.widget.textbox,
					align = "center",
				},
			},
		},
	})

	local tagpanel = wibox.widget({
		type = "normal",
		{
			layout = wibox.layout.margin,
			left = 15,
			right = 15,
			{
				layout = wibox.layout.fixed.horizontal,
				s.mytaglist,
			},
		},
		bg = beautiful.wibar_panel_bg,
		shape = gears.shape.rounded_bar,
		widget = wibox.container.background,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 32,
		ontop = false,
		bg = beautiful.wibar_bg,
		fg = beautiful.wibar_fg,
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.margin,
		valign = "center",
		top = dpi(5),
		{
			layout = wibox.layout.stack,
			{
				layout = wibox.layout.align.horizontal,
				{ -- Left widgets
					layout = wibox.layout.fixed.horizontal,
					sep,
					mediapanel,
				},
				nil,
				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					sep,
					timepanel,
					sep,
				},
			},
			{
				tagpanel,
				valign = "center",
				halign = "center",
				layout = wibox.container.place,
			},
		},
	})
end)
