require("lua/variables")
require("lua/wibar")
require("lua/autostart")
require("lua/keybinds")
require("lua/titlebar")
require("lua/clients")
require("awful.hotkeys_popup.keys")
-- }}}

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- Autostart Windowless processes
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "unclutter -root" }) -- entries must be comma-separated
-- }}}

-- Theme {{{
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")
-- }}}


-- Layouts
awful.layout.layouts = {
    --awful.layout.suit.floating,
    --awful.layout.suit.tile,
    awful.layout.suit.fair,
}
-- }}}

-- Tags {{{
awful.tag({ "", "", "", "", "", ""}, s, awful.layout.layouts[1])
-- }}}
