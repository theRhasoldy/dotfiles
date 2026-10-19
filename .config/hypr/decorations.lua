-- Decorations (was decorations.conf)
hl.config({
  decoration = {
    border_part_of_window = false,
    rounding = 10,
    rounding_power = 2.5,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    dim_inactive = true,
    dim_strength = 0.15,

    shadow = {
      -- hyprglass force-enables this while glass is active; these values give it the soft macOS look
      enabled = false,
    },

    motion_blur = {
      enabled = true,
    },

    blur = {
      brightness = 0.5,
      new_optimizations = true,
      popups = true,
      enabled = true,
      size = 8,
      passes = 3,
      ignore_opacity = true,
      xray = false,
      -- 0.0: GTK menus/popovers are translucent but their surface alpha
      -- (averaged over the shadow margin) stays under 0.5, which made
      -- Hyprland skip their blur entirely. Blur every popup instead.
      popups_ignorealpha = 0.2,
      special = true,
    },
  },
})
