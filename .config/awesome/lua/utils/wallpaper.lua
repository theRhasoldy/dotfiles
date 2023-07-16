local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, false, { x = 0, y = 0 })
  end
end

-- Re-set wallpaper when a screen's geometry changes
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)
end)
