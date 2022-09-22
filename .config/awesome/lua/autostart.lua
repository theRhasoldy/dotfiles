local awful = require("awful")

awful.spawn.with_shell("picom --experimental-backend")
awful.spawn.with_shell("lxsession")
awful.spawn.with_shell("feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg")
awful.spawn.with_shell("greenclip daemon")
