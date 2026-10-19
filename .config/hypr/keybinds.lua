-- Keybinds (was keybinds.conf)

-- Old hyprland.conf variables (only used here)
local terminal = "ghostty"
local fileManager = "thunar"
-- selene: allow(unused_variable)
local menu = "rofi -show run" -- (unused, kept for future binds)
local config = os.getenv("HOME") .. "/.config" -- was `$config = ~/.config`

hl.config({
  binds = {
    allow_workspace_cycles = true,
    workspace_center_on = 1,
  },
})

-- Lid
hl.bind("switch:off:[Lid Switch]", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
hl.bind("switch:on:[Lid Switch]", hl.dsp.exec_cmd("swaylock"), { locked = true })

-- Apps
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + I", hl.dsp.exec_cmd("vivaldi && rm -rf ~/.pki/"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("/usr/bin/obsidian"))

-- Rofi
hl.bind("SUPER + R", hl.dsp.exec_cmd("rofi -config " .. config .. "/rofi/app.rasi -show drun"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("rofi -config " .. config .. "/rofi/window.rasi -show window"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("bash " .. config .. "/scripts/clipboard.sh"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("bash " .. config .. "/scripts/grimchoice.sh"))

hl.bind("SUPER + P", hl.dsp.exec_cmd("bash " .. config .. "/scripts/colorpick.sh"))

-- Screenshots
-- Dedicated screenshot-icon key: firmware emits Super+Shift+S (verified via evdev)
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimshot --notify copy area"))
-- Prt Sc key (emits keysym `Print`): white flash first, then full desktop to clipboard
hl.bind("Print", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/screenshot-flash; grimshot --notify copy screen"))

hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("bash " .. config .. "/scripts/powermenu.sh"))

hl.bind("SUPER + G", hl.dsp.exec_cmd("bash " .. config .. "/scripts/websearch.sh"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("bash " .. config .. "/scripts/rofitab.sh"))

-- Mouse
hl.bind("CTRL + SHIFT + KP_END", hl.dsp.focus({ workspace = "previous" }))
hl.bind("CTRL + SHIFT + KP_DOWN", hl.dsp.exec_cmd("kitty"))

-- Volume (swayosd OSD)
hl.bind("SUPER + 0", hl.dsp.exec_cmd("swayosd-client --output-volume raise --max-volume 150"), { repeating = true })
hl.bind("SUPER + 9", hl.dsp.exec_cmd("swayosd-client --output-volume lower --max-volume 150"), { repeating = true })
hl.bind("SUPER + minus", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { repeating = true })

hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("swayosd-client --output-volume raise --max-volume 150"),
  { repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("swayosd-client --output-volume lower --max-volume 150"),
  { repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { repeating = true })

-- Microphone: the mic-icon key (Fn+F4) emits evdev 185 / xkb keycode 193.
-- Its xkb keymap entry has no usable keysym, so bind by keycode ("code:193").
-- LED follows the mute state via micmute-led.service.
hl.bind("code:193", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"))

hl.bind("SUPER + F", hl.dsp.layout("colresize +conf"), { repeating = true })

-- Media
hl.bind("SUPER + bracketright", hl.dsp.exec_cmd("playerctl next"))
hl.bind("SUPER + bracketleft", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER + backslash", hl.dsp.exec_cmd("playerctl play-pause"))

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { repeating = true })

-- Laptop Keyboard
-- `hyprctl keyword` no longer exists in the Lua era; use `hyprctl eval`.
-- The device's full config is restated so its kb_options are not clobbered.
hl.bind(
  "F8",
  hl.dsp.exec_cmd(
    'hyprctl eval \'hl.device({ name = "at-translated-set-2-keyboard", kb_options = "grp:alt_shift_toggle, caps:swapescape", enabled = false })\''
  ),
  { repeating = true }
)
hl.bind(
  "SHIFT + F8",
  hl.dsp.exec_cmd(
    'hyprctl eval \'hl.device({ name = "at-translated-set-2-keyboard", kb_options = "grp:alt_shift_toggle, caps:swapescape", enabled = true })\''
  ),
  { repeating = true }
)

-- Client manipulation
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + F11", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + R", hl.dsp.force_renderer_reload())
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.pin())

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Move focus
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + N", hl.dsp.window.cycle_next())

-- Workspaces
hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))

hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "previous" }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "special:spotify" }))
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("spotify"))

hl.bind("SUPER + SHIFT + Z", hl.dsp.window.move({ workspace = "special:mini" }))
hl.bind("SUPER + Z", hl.dsp.workspace.toggle_special("mini"))

hl.bind("SUPER + SHIFT + A", hl.dsp.window.move({ workspace = "special:pad" }))
hl.bind("SUPER + A", hl.dsp.workspace.toggle_special("pad"))

-- Gestures
hl.gesture({ fingers = 2, direction = "pinchout", mods = "SUPER", action = "float", mode = "float" })
hl.gesture({ fingers = 2, direction = "pinchin", mods = "SUPER", action = "float", mode = "tile" })

hl.gesture({
  fingers = 3,
  direction = "left",
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = "right" }))
  end,
})

hl.gesture({
  fingers = 3,
  direction = "right",
  action = function()
    hl.dispatch(hl.dsp.focus({ direction = "left" }))
  end,
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
