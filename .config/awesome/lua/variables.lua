-- Libraries {{{
pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")

-- Statusbar & Layouts
wibox = require("wibox")

-- Theme handling library
beautiful = require("beautiful")

-- Notification library
naughty = require("naughty")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")

theme = require("theme")
xresources = require("beautiful.xresources")
dpi = xresources.apply_dpi
-- }}}

-- Variables {{{
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"

tagNum = 4
-- }}}
