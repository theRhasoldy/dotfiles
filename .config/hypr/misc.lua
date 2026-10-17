-- Misc options activated from misc.conf during the Lua migration (2026-10-16).
-- NOTE: misc.conf was not sourced by the old hyprland.conf, so these options
-- were previously NOT active. They are now part of the loaded config.
hl.config({
    misc = {
        always_follow_on_dnd = true,
        enable_swallow = true,
        close_special_on_empty = true,
        on_focus_under_fullscreen = 1,   -- was `new_window_takes_over_fullscreen = 1`
        disable_splash_rendering = true, -- was `splash = false`
        vrr = 0,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        disable_autoreload = false,
    },
    debug = {
        vfr = true, -- was `misc.vfr`
    },
    render = {
        direct_scanout = 1, -- was `misc.direct_scanout`
    },
})

-- Dropped: `render.explicit_sync = 2` — option no longer exists in Hyprland 0.56.
