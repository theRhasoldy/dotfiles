local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local wibox = require("wibox")

local naughty = require("naughty")
local gears = require("gears")

-- Default config
naughty.config.defaults.position = "bottom_right"
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

  local icon_visibility
  local time = os.date("%H:%M")
  local header_color = "#eeeeee80"

  local time_widget = wibox.widget({
    widget = wibox.widget.textbox,
    markup = "<span foreground = " .. "'" .. header_color .. "'>" .. time .. "</span>",
    font = beautiful.notification_info_font,
    align = "right",
  })

  local app = wibox.widget({
    widget = wibox.widget.textbox,
    markup = "<span foreground = " .. "'" .. header_color .. "'>" .. n.app_name .. "</span>",
    font = beautiful.notification_info_font,
    align = "left",
  })

  local title = wibox.widget({
    widget = wibox.widget.textbox,
    font = beautiful.notification_header_font,
    align = "left",
    markup = n.title,
  })

  local message = wibox.widget({
    widget = wibox.widget.textbox,
    font = beautiful.notification_font,
    align = "left",
    markup = n.message,
  })

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
  -- }}}

  if n.icon == nil then
    icon_visibility = false
  else
    icon_visibility = true
  end

  -- Action widget {{{
  local action_widget = {
    {
      {
        id = "text_role",
        align = "center",
        font = beautiful.notification_header_font,
        widget = wibox.widget.textbox,
      },
      margins = { left = dpi(6), right = dpi(6) },
      widget = wibox.container.margin,
    },
    widget = wibox.container.background,
  }
  -- }}}

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
  -- }}}

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
end

naughty.connect_signal("request::display", function(n)
  notif_template(n)
end)
