-- WARNING: This config only works with awesome-git
pcall(require, "luarocks.loader")

local beautiful = require("beautiful")
local gears = require("gears")

-- Error handling
local naughty = require("naughty")
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification({
    urgency = "critical",
    title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message = message,
  })
end)

beautiful.init(gears.filesystem.get_configuration_dir() .. "lua/utils/theme.lua")

require("lua.utils")
require("lua.options")
require("lua.ui")
