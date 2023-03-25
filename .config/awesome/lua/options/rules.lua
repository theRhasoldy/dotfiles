local awful = require("awful")
local gears = require("gears")
local ruled = require("ruled")

require("awful.autofocus")
require("lua.options.keybinds")

ruled.client.connect_signal("request::rules", function()
  -- All clients will match this rule.
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      focus = awful.client.focus.filter,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      maximized = false,
      raise = true,
    },
  })

  -- Floating clients.
  ruled.client.append_rule({
    id = "floating",
    rule_any = {
      instance = {},
      class = {
        "Arandr",
        "Sxiv",
        "Xarchiver",
        "Spotify",
      },
      name = {
        "Picture in picture",
      },
      role = {
        "pop-up",
      },
      type = {
        "splash",
        "dialog",
        "menu",
        "utility",
        "popup_menu",
        "combo",
        "dnd",
      },
    },
    properties = { floating = true },
  })

  ruled.client.append_rule({
    id = "ontop",
    rule_any = {
      class = {
        "spad",
        "pop",
        "Spotify",
      },
    },
    properties = { ontop = true },
  })

  ruled.client.append_rule({
    rule = { class = "Vivaldi-snapshot" },
    properties = { screen = 1, tag = "" },
  })

  ruled.client.append_rule({
    rule = { class = "obsidian" },
    properties = { screen = 1, tag = "" },
  })
end)
-- }}}

client.connect_signal("request::manage", function(c)
  -- Split to right
  if not awesome.startup then
    awful.client.setslave(c)
  end
end)

-- Focus follows mouse {{{
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
-- }}}
