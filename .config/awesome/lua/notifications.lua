local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")

local naughty = require("naughty")
local gears = require("gears")

-- Default config
-- naughty.config.defaults.position = "bottom_right"
naughty.config.defaults.spacing = dpi(10)
naughty.config.defaults.padding = dpi(10)
naughty.config.defaults.margin = dpi(10)

-- Presets
naughty.config.presets.low.timeout = 5
naughty.config.presets.normal.timeout = 6
naughty.config.presets.critical.timeout = 12

naughty.config.presets.critical.bg = beautiful.highlight
naughty.config.presets.critical.fg = beautiful.bg_normal

local function notif_template(n)
	local sep = wibox.widget({
		widget = wibox.widget.seperator,
		forced_width = dpi(20),
	})

	local time = os.date("%H:%M")
	local notif_header = "#b1789b"

	local time_widget = wibox.widget.textbox()
	time_widget.markup = "<span foreground = " .. "'" .. notif_header .. "'>" .. time .. "</span>"
	time_widget.align = "right"

	local app = wibox.widget.textbox()
	app.markup = "<span foreground = " .. "'" .. notif_header .. "'>" .. n.app_name .. "</span>"
	app.align = "left"

	local icon_visibility

	if n.icon == nil then
		icon_visibility = false
	else
		icon_visibility = true
	end

	-- Action widget
	local action_widget = {
		{
			{
				id = "text_role",
				align = "center",
				font = "Ubuntu Bold 9",
				widget = wibox.widget.textbox,
			},
			margins = { left = dpi(6), right = dpi(6) },
			widget = wibox.container.margin,
		},
		widget = wibox.container.background,
	}

	-- Apply action widget ^
	local actions = wibox.widget({
		notification = n,
		base_layout = wibox.widget({
			spacing = dpi(8),
			layout = wibox.layout.flex.horizontal,
		}),
		widget_template = action_widget,
		widget = naughty.list.actions,
	})

	-- Make other widgets
	local title = wibox.widget.textbox()
	title.font = "Ubuntu bold 9"
	title.align = "left"
	title.markup = n.title

	local message = wibox.widget.textbox()
	message.font = "Ubuntu 9"
	message.align = "left"
	message.markup = n.message

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
			width = dpi(48),
			height = dpi(48),
			widget = wibox.container.constraint,
		},
		expand = "none",
		layout = wibox.layout.align.vertical,
	})

	local container = wibox.widget({
		{
			{
				layout = wibox.layout.stack,
				{
					layout = wibox.layout.align.horizontal,
					{ -- Left widgets
						layout = wibox.layout.fixed.horizontal,
						app,
					},
					nil,
					{ -- Right widgets
						layout = wibox.layout.fixed.horizontal,
						time_widget,
					},
				},
			},
			{

				layout = wibox.layout.fixed.horizontal,
				icon,
				sep,
				{
					title,
					message,
					layout = wibox.layout.fixed.vertical,
					valign = "center",
				},
			},
			actions,
			spacing = dpi(10),
			layout = wibox.layout.fixed.vertical,
		},
		margins = dpi(20),
		widget = wibox.container.margin,
	})

	naughty.layout.box({
		notification = n,
		type = "notification",
		spacing = 100,
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, dpi(15))
		end,
		widget_template = {
			{
				{
					{
						widget = container,
					},
					strategy = "max",
					width = dpi(620),
					widget = wibox.container.constraint,
				},
				strategy = "min",
				width = dpi(280),
				height = dpi(80),
				widget = wibox.container.constraint,
			},
			bg = beautiful.bg,
			widget = wibox.container.background,
		},
	})
end

naughty.connect_signal("request::display", function(n)
	notif_template(n)
end)
