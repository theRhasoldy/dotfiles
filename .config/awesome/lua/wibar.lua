local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local sep = wibox.widget({
	widget = wibox.widget.textbox,
	markup = "       ",
})

local mytextdate = wibox.widget({
	widget = wibox.widget.textclock,
	format = "%a %b %d",
	font = beautiful.wibar_font,
})

local mytextclock = wibox.widget({
	widget = wibox.widget.textclock,
	format = "%R",
	font = beautiful.wibar_font,
})

Volume_widget = require("widgets.volume-widget.volume")

local spotify_widget = require("widgets.spotify-widget.spotify")

local layoutbox = awful.widget.layoutbox(s)

local tray = wibox.widget.systray()

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
			{
				layout = wibox.layout.flex.horizontal,
				{
					id = "text_role",
					widget = wibox.widget.textbox,
				},
			},
		},
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 22,
		ontop = false,
		bg = beautiful.wibar_bg,
		fg = "#0f1115",
	})

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.stack,
		{
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				sep,
				layoutbox,
			},
			nil,
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				tray,
				sep,
				spotify_widget({
					font = beautiful.font,
					dim_when_paused = true,
					dim_opacity = 0.5,
					max_length = -1,
					timeout = 0,
				}),
				sep,
				Volume_widget({
					widget_type = "icon",
					device = "pipewire",
				}),
				sep,
				mytextdate,
				sep,
				mytextclock,
				sep,
			},
		},
		{
			s.mytaglist,
			valign = "center",
			halign = "center",
			layout = wibox.container.place,
		},
	})
end)
