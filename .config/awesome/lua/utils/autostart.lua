local awful = require("awful")
local naughty = require("naughty")

local script = os.getenv("XDG_CONFIG_HOME") .. "/scripts/"
awful.spawn.with_shell(script .. "autostart.sh")
