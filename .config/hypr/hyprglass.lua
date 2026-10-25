-- hyprglass — Apple Liquid Glass (https://github.com/hyprnux/hyprglass)
-- Look: macOS Tahoe style — built on the plugin's Apple preset "pomme", tuned
-- glossier: stronger top highlight, faint spectral edge, gentle lens dome.
--
-- Load the plugin from here. Its hl.plugin bindings only register while the
-- Lua config manager is active, and declaring it in the config makes Hyprland
-- load the hyprpm build every session.

hl.plugin.load("/var/cache/hyprpm/rhasoldy/HyprGlass/hyprglass.so")

if hl.plugin.hyprglass then
  local hg = hl.plugin.hyprglass

  hg.config({
    default_theme = "dark",
    default_preset = "tahoe",
    layers = { enabled = true },
  })

  -- Layer surfaces: each call whitelists the namespace and configures it
  -- (mask_threshold hides layer shadows fainter than 5% alpha)
  -- waybar: no glass (blur removed on request) — the CSS gradient scrim
  -- renders crisply over whatever is behind the bar.
  hg.layer("waybar", { exclude = true })
  hg.layer("notifications", { preset = "tahoe", mask_threshold = 0.35 }) -- mako
  -- rofi: mask_feather 0.55 ramps the glass in over the panel's own 60%
  -- antialiased corner ramp -> smooth, high-fidelity glass edges (no steps).
  hg.layer("rofi", { preset = "tahoe", mask_threshold = 0.05, mask_feather = 0.55 })
  -- vinyl: GTK4 requests a bg-effect region that can resolve empty -> no glass
  -- under mask_mode="auto", same as swayosd. Force the alpha mask.
  hg.layer("vinyl", { preset = "tahoe", mask_mode = "alpha", mask_threshold = 0.02, mask_feather = 0.55 })
  -- swayosd: force the alpha mask — GTK may request a bg-effect region that
  -- yields no glass under mask_mode="auto"
  hg.layer("swayosd", { preset = "tahoe", mask_mode = "alpha", mask_threshold = 0.16, mask_feather = 0.55 })
  hg.layer("debug-panel", { exclude = true })
  -- hg.layer("quickshell:bezel", { preset = "tahoe", mask_threshold = 0.3 }) -- if quickshell is used

  -- macOS Tahoe glass: pomme (thin edge lensing, soft top light, faint bevel)
  -- + glossier specular, subtle chromatic edge, slight lens dome, a touch of
  -- vibrancy in dark mode. Commented value = pomme's own.
  hg.preset("tahoe", {
    inherits = "pomme",
    specular_strength = 0.55, -- 0.4  brighter top gloss
    chromatic_aberration = 0.12, -- 0.0  faint spectral edge
    lens_distortion = 0.15, -- 0.0  gentle center lens
    fresnel_strength = 0.2, -- 0.1  soft edge glow
    dark = { vibrancy = 0.1 }, -- 0.0  richer colors through dark glass
  })

  -- Formerly the menu bar preset (frost, no edge optics). Currently unused
  -- (bar glass removed), kept for reuse if the bar is glassed again.
  hg.preset("bar", {
    inherits = "tahoe",
    bevel_strength = 0,
    fresnel_strength = 0,
    specular_strength = 0,
    chromatic_aberration = 0,
    lens_distortion = 0,
    refraction_strength = 0,
  })
end
