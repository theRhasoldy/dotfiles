-- Hyprland configuration (Lua)
-- Migrated from hyprlang (hyprland.conf) on 2026-10-16.
--
-- The old hyprland.conf only declared variables and sourced the files below;
-- each is now a Lua module loaded via require(). Old variables
-- ($terminal, $fileManager, $menu, $config) live in keybinds.lua where they are used.

require("autostart")
require("general")
require("input")
require("display")
require("rules")
require("keybinds")
require("scratchpads")
require("decorations")
require("animations")
require("misc")
require("hyprglass")
require("overview")
