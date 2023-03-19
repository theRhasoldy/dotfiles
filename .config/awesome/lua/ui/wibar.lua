local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local theme = require("lua.utils.theme")

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local space = dpi(18)

local function create_icon(symbol, color)
  return wibox.widget({
    widget = wibox.widget.background,
    fg = color,
    {
      widget = wibox.widget.textbox,
      valign = "center",
      text = symbol,
    },
  })
end

local time = wibox.widget({
  widget = wibox.widget.textclock,
  format = "%H:%M",
})

local date = wibox.widget({
  widget = wibox.widget.textclock,
  format = "%a %b %d",
})

local systray = wibox.widget.systray()

local uptime_text = wibox.widget({
  widget = awful.widget.watch(
    "mem '${gb_used}GB │ ${gb_total}GB'",
    5,
    function(widget, stdout) -- fetchutils https://github.com/kiedtl/fetchutils
      local out = stdout:gsub("^%s*(.-)%s*$", "%1")
      widget:set_text(out)
    end
  ),
})

awful.screen.connect_for_each_screen(function(s)
  s.mylayoutbox = awful.widget.layoutbox(s)

  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    layout = {
      spacing = space / 2,
      layout = wibox.layout.fixed.horizontal,
    },
  })

  -- Create the wibox
  s.mywibox = awful.wibar({ height = space * 2, border_width = dpi(7), position = "bottom", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup({
    -- Margin
    widget = wibox.container.margin,
    margins = space / 2,
    {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.grid,
        homogeneous = false,
        forced_num_cols = 2,
        spacing = space,
        s.mylayoutbox,
        s.mytaglist,
      },
      nil,
      { -- Right widgets
        layout = wibox.layout.grid,
        homogeneous = false,
        forced_num_cols = 4,
        spacing = space,
        systray,
        {
          layout = wibox.layout.fixed.horizontal,
          spacing = space / 2,
          create_icon("󰓅", theme.icon_color_1),
          uptime_text,
        },
        {
          layout = wibox.layout.fixed.horizontal,
          spacing = space / 2,
          create_icon("󱓼", theme.icon_color_2),
          date,
        },
        {
          layout = wibox.layout.fixed.horizontal,
          spacing = space / 2,
          create_icon("󰔟", theme.icon_color_3),
          time,
        },
      },
    },
  })
end)
