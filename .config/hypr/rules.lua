-- Window, layer and workspace rules (was rules.conf)

-- ==============================================================================
-- 1. LAYER RULES
-- ==============================================================================

hl.layer_rule({
    name = "blur-notifications",
    match = { namespace = "^(notifications)$" },
    blur = true,
    xray = false,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "blur-launcher",
    match = { namespace = "^(rofi|wofi)$" },
    blur = true,
    xray = false,
    ignore_alpha = 0.5,
})

-- Launcher motion: rise up from the bottom edge with a fade (reverse on
-- close). Per-layer style overrides the global layersIn/Out "fade".
-- NOTE: scripts/powermenu.sh disables this rule while the powermenu is open
-- (via hyprctl repl) and re-enables it after, so only the launcher slides.
hl.layer_rule({
    name = "rofi-slide",
    match = { namespace = "^(rofi)$" },
    animation = "slide bottom",
})


-- ==============================================================================
-- 2. XWAYLAND & SYSTEM FIXES (Preserved & Optimized)
-- ==============================================================================

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "fix-empty-unfocused",
    match = { class = "^$", title = "^$" },
    no_blur = true,
})

hl.window_rule({
    name = "hide-xwaylandvideobridge",
    match = { initial_class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override 0.0 override",
    no_anim = true,
    no_initial_focus = true,
    max_size = { 1, 1 },
    no_blur = true,
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "^(hyprland-run)$" },
    move = { 20, "monitor_h - 120" }, -- was `move = 20 monitor_h-120`
    float = true,
})


-- ==============================================================================
-- 3. VIVALDI & MEDIA OPTIMIZATIONS
-- ==============================================================================

-- Slight transparency strictly on static start/home tabs
hl.window_rule({
    name = "vivaldi-startpage",
    match = { title = "^(Start Page - Vivaldi|Vivaldi - Vivaldi)$" },
    opacity = "0.95 override",
})

-- Main Vivaldi window: Opaque and no blur to protect Intel VA-API decoding
hl.window_rule({
    name = "vivaldi-hardware-decode",
    match = { class = "^(Vivaldi-stable|vivaldi-stable)$" },
    opaque = true,
    no_blur = true,
})

-- Picture-in-Picture: Floated, pinned, locked aspect ratio, zero blur/dim overhead
hl.window_rule({
    name = "pip-floating-optimized",
    match = { title = "(?i)(picture.in.picture|picture-in-picture)" },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    no_blur = true,
    no_dim = true,
    move = { "monitor_w * 0.72", "monitor_h * 0.72" }, -- was `move = 72% 72%`
    size = { "monitor_w * 0.25", "monitor_h * 0.25" }, -- was `size = 25% 25%`
})


-- ==============================================================================
-- 4. WORKSTATION, CODE & SYSTEM DIALOGS
-- ==============================================================================

-- Terminals & Editors: Solid opacity and fast execution without blur lag
hl.window_rule({
    name = "terminal-solid",
    match = { class = "^(kitty|Alacritty|foot)$" },
    opacity = "1.0 1.0",
    no_blur = true,
})

-- Fullscreen Windows: Always solid opacity and prevent display sleep
hl.window_rule({
    name = "fullscreen-solid",
    match = { fullscreen = true },
    opacity = "1.0 override",
})

hl.window_rule({
    name = "inhibit-fullscreen-sleep",
    match = { fullscreen = true },
    idle_inhibit = "fullscreen",
})

-- Media Players: Inhibit sleep on focus
hl.window_rule({
    name = "inhibit-media-sleep",
    match = { class = "^(mpv|vlc)$" },
    idle_inhibit = "focus",
})

-- Hardware-accelerated presentation for games/test apps
hl.window_rule({
    name = "immediate-presentation",
    match = { class = "^(mpv|steam_app_.*|gamescope|vkcube)$" },
    immediate = true,
})

-- System dialogs & Audio controls: Centered floating windows
hl.window_rule({
    name = "float-pavucontrol",
    match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol)$" },
    float = true,
    center = true,
    size = { 800, 500 },
})

hl.window_rule({
    name = "float-network-bluetooth",
    match = { class = "^(blueman-manager|nm-connection-editor)$" },
    float = true,
    center = true,
})

-- Native file pickers & Authentication agents
hl.window_rule({
    name = "float-file-pickers",
    match = { title = "^(Open File|Select a File|Save File|Open Folder)$" },
    float = true,
})

hl.window_rule({
    name = "float-portals",
    match = { class = "^(xdg-desktop-portal-.*|polkit-gnome-authentication-agent-1)$" },
    float = true,
})

hl.window_rule({
    name = "ghostty-blur",
    match = { class = "^(com.mitchellh.ghostty|ghostty)$" },
    opacity = "0.98 override 0.95 override",
    no_blur = false,
    opaque = false,
    no_shadow = false,
})
