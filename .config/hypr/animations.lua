-- Animations (was animations.conf)
hl.config({
  animations = {
    enabled = true,
  },
})

-- Snappy cubic-bezier curves with instant initial response
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Base tree animation (low fallback duration)
hl.animation({ leaf = "global", enabled = true, speed = 2.5, bezier = "easeOutQuint" })

-- Windows: fast snap on spawn, clean fade out on close
hl.animation({ leaf = "windows", enabled = true, speed = 2.8, bezier = "easeOutExpo", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.8, bezier = "quick", style = "popin 85%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2.2, bezier = "easeOutQuint" })

-- Layers (Rofi, Waybar, notifications)
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "quick", style = "fade" })

-- Layer alpha fade (open/close snapshots). scripts/powermenu.sh slows these to
-- 6/5 for the powermenu slow-fade and restores to the values below.
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "quick" })

-- Fading & Workspace switching
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slide" })

-- Disable continuous border angle cycling to protect VFR idle state
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "borderangle", enabled = false }) -- was `animation = borderangle, 0`
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 2.5, bezier = "quick" })
