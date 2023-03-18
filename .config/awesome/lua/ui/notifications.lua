local naughty = require("naughty")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

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

  local app = wibox.widget({
    widget = wibox.widget({
      widget = wibox.widget.background,
      fg = beautiful.taglist_fg_occupied,
      {
        widget = wibox.widget.textbox,
        text = n.app_name,
      },
    }),
  })

  local container = wibox.widget({
    {
      {
        widget = wibox.container.margin,
        margins = dpi(20),
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

        layout = wibox.layout.fixed.horizontal,
        {
          layout = wibox.layout.fixed.vertical,
          valign = "center",
        },
      },
      spacing = dpi(10),
      layout = wibox.layout.fixed.vertical,
    },
    margins = dpi(20),
    widget = wibox.container.margin,
  })

  naughty.layout.box({
    notification = n,
    type = "notification",
    spacing = 200,
    --[[ shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, 20)
		end, ]]
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
      bg = beautiful.notification_bg,
      border_width = 1,
      border_color = beautiful.border_normal,

      widget = wibox.container.background,
    },
  })
end)
