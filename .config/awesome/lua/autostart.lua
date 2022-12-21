local awful = require("awful")

awful.spawn.with_shell("picom --experimental-backend")
-- awful.spawn.with_shell("xset r rate 200 40")
awful.spawn.with_shell("xremap $HOME/.config/xremap.yml")
awful.spawn.with_shell("xbanish -t 10")
awful.spawn.once("lxsession")
awful.spawn.with_shell("greenclip daemon")
awful.spawn.with_shell("feh --bg-fill --no-fehbg /usr/share/backgrounds/background.jpg")
