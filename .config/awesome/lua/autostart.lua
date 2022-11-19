local awful = require("awful")

awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("xbanish -t 5")
awful.spawn.with_shell("lxsession")
awful.spawn.with_shell("greenclip daemon")
awful.spawn.with_shell("feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg")
