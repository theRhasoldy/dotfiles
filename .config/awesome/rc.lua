local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local theme = require("theme")

pcall(require, "luarocks.loader")

home_path = os.getenv("HOME") .. "/"
scripts_path = home_path .. ".config/scripts/"

-- Load Modules {{{
require("lua.autostart")
require("lua.wibar")
require("lua.keybinds")
require("lua.clients")
require("lua.notifications")
require("awful.hotkeys_popup.keys")
-- }}}

-- Theme {{{
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")
-- }}}

-- Layouts
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.fair,
	awful.layout.suit.max,
}
-- }}}

-- Tags {{{
awful.tag({ "", "", "", "", "", "", "" }, s, awful.layout.layouts[1])
-- }}}
