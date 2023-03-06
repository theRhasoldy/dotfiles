local wibox = require("wibox")

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local space = dpi(20)
local small_space = dpi(5)

-- Uptime {{{
local uptime_text = wibox.widget.textbox()
uptime_text.font = beautiful.wibar_font
awful.widget.watch("upt", 60, function(_, stdout) -- fetchutils https://github.com/kiedtl/fetchutils
  local out = stdout:gsub("^%s*(.-)%s*$", "%1")
  uptime_text.text = out
end)
-- }}}

-- Memory {{{
local memory_widget = wibox.widget.textbox()
memory_widget.font = beautiful.wibar_font
awful.widget.watch("mem", 15, function(_, stdout) -- fetchutils https://github.com/kiedtl/fetchutils
  local out = stdout:gsub("^%s*(.-)%s*$", "%1")
  memory_widget.text = out
end)
-- }}}

local function create_icon(symbol)
  local icon = wibox.widget.textbox()
  icon.font = "Symbols Nerd Font 9"
  icon.text = symbol
  return icon
end

-- Layout box {{{
local layoutbox = awful.widget.layoutbox(s)
-- }}}

-- Time Panel {{{
local timepanel = wibox.widget({
  {
    layout = wibox.layout.margin,
    left = dpi(10),
    right = dpi(10),
    {
      layout = wibox.layout.fixed.horizontal,
      spacing = space,
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = small_space,
        create_icon(""),
        {
          format = "%a %b %d",
          font = beautiful.wibar_font,
          widget = wibox.widget.textclock,
        },
      },
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = small_space,
        create_icon(""),
        {
          format = "%R",
          font = beautiful.wibar_font,
          widget = wibox.widget.textclock,
        },
      },
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = small_space,
        create_icon("󰔶"),
        memory_widget,
      },
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = small_space,
        create_icon("󰜎"),
        uptime_text,
      },
      layoutbox,
    },
  },
  bg = beautiful.wibar_panel_bg,
  shape = gears.shape.rounded_bar,
  valign = "center",
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
    left = space,
    {
      layout = wibox.layout.fixed.horizontal,
      forced_height = 22,
      spacing = space,
      Volume_widget({
        widget_type = "icon",
        device = "pipewire",
      }),
      spotify_widget({
        font = beautiful.wibar_font,
        dim_when_paused = true,
        dim_opacity = 0.5,
        max_length = 100,
        timeout = 0,
      }),
    },
  },
  bg = beautiful.wibar_panel_bg,
  shape = gears.shape.rounded_bar,
  widget = wibox.container.background,
})
-- }}}

-- Create a promptbox for each screen {{{
awful.screen.connect_for_each_screen(function(s)
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 3, function()
      awful.layout.inc( -1)
    end),
    awful.button({}, 4, function()
      awful.layout.inc(1)
    end),
    awful.button({}, small_space, function()
      awful.layout.inc( -1)
    end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    widget_template = {
      widget = wibox.container.background,
      forced_width = dpi(34.5),
      forced_height = dpi(30),
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
      left = dpi(10),
      right = dpi(10),
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
    position = "bottom",
    screen = s,
    height = dpi(32),
    ontop = false,
    bg = beautiful.wibar_bg,
    fg = beautiful.wibar_fg,
  })

  -- Add widgets to the wibox
  s.mywibox:setup({
    layout = wibox.layout.margin,
    valign = "center",
    {
      layout = wibox.layout.stack,
      {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          mediapanel,
        },
        nil,
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          timepanel,
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
-- }}}
