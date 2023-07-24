local naughty = require("naughty")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local theme = require("lua.utils.theme")
local dpi = beautiful.xresources.apply_dpi

naughty.config.defaults.position = "top_right"
naughty.notification_closed_reason.too_many_on_screen = 5

naughty.connect_signal("request::display", function(n)
	local time = wibox.widget({
		widget = wibox.widget({
			widget = wibox.widget.background,
			fg = beautiful.taglist_fg_occupied,
			{
				widget = wibox.widget.textclock,
				format = "%H:%M",
			},
		}),
	})

	-- Symbol based on different app names
	local symbol = "󱨇  "

	if n.app_name == "Spotify" then
		symbol = "  "
	end

	if n.app_name == "Vivaldi" then
		symbol = "󰣠  "
	end

	local app = wibox.widget({
		widget = wibox.widget({
			widget = wibox.widget.background,
			fg = beautiful.taglist_fg_occupied,
			{
				widget = wibox.widget.textbox,
				text = symbol .. n.app_name,
			},
		}),
	})

	local title = wibox.widget({
		widget = wibox.widget.textbox,
		font = theme.notification_header_font,
		text = n.title,
	})

	local icon_visibility
	local icon = wibox.widget({
		nil,
		{
			{
				image = n.icon,
				visible = icon_visibility,
				widget = wibox.widget.imagebox,
				shape = gears.shape.rounded_bar,
			},
			strategy = "max",
			width = dpi(58),
			height = dpi(48),
			widget = wibox.container.constraint,
		},
		expand = "none",
		layout = wibox.layout.align.vertical,
	})

	-- Check if icon exists else just show title and message
	if n.icon == nil then
		icon_visibility = false
	else
		icon_visibility = true
	end

	local message = wibox.widget({
		widget = wibox.widget.textbox,
		text = n.message,
	})

	-- Actions body
	local action_widget = {
		widget = wibox.container.margin,
		left = dpi(24),
		right = dpi(24),
		top = dpi(16),
		{
			{
				id = "text_role",
				align = "center",

				widget = wibox.widget.textbox,
			},
			shape = gears.shape.rounded_rect,
			shape_border_width = 2,
			shape_border_color = beautiful.bg_normal,
			forced_height = 30,
			widget = wibox.container.background,
		},
	}

	local actions = wibox.widget({
		notification = n,
		base_layout = wibox.widget({
			spacing = dpi(8),
			layout = wibox.layout.flex.horizontal,
		}),
		widget_template = action_widget,
		widget = naughty.list.actions,
	})

	-- Build notification widget {{{
	local container = wibox.widget({
		{
			{
				widget = wibox.container.margin,
				bottom = dpi(18),
				{
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						app,
					},
					nil,
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						time,
					},
				},
			},
			{
				widget = wibox.container.margin,
				layout = wibox.layout.grid,
				homogeneous = false,
				forced_num_rows = 1,
				forced_num_cols = 3,
				spacing = 20,
				icon,
				{
					layout = wibox.layout.fixed.vertical,
					title,
					message,
					actions,
				},
			},
			spacing = dpi(10),
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.margin,
		margins = dpi(20),
	})
	-- }}}

	naughty.layout.box({
		notification = n,
		type = "notification",
		widget_template = {
			{
				{
					{
						widget = container,
					},
					strategy = "max",
					width = dpi(380),
					widget = wibox.container.constraint,
				},
				strategy = "min",
				width = dpi(380),
				height = dpi(80),
				widget = wibox.container.constraint,
			},
			border_width = 1,
			border_color = beautiful.notification_border_color,

			widget = wibox.container.background,
		},
	})
end)
