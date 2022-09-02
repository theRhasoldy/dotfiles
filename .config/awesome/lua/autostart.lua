local awful = require("awful")
awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("greenclip daemon")
