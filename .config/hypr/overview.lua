-- Workspace overview (Hyprspace) — https://github.com/KZDKM/Hyprspace
-- Built from commit 96a3b95 (pin for Hyprland 0.56.0) and loaded like hyprglass:
-- the .so registers its hl.plugin bindings only while the Lua config is active,
-- so declaring it here also makes Hyprland load it every session.
--
-- SUPER + ` toggles the overview; drag windows onto a workspace to move them,
-- click a workspace to switch, click empty space / ESC to exit.

hl.plugin.load(os.getenv("HOME") .. "/.local/lib/hyprspace/Hyprspace.so")

-- Styling follows the neutral dark scheme in general.lua (borders #333333).
hl.config({
  plugin = {
    overview = {
      panelColor = "rgba(0a0a0aff)",
      panelBorderColor = "rgba(333333ff)",
      panelBorderWidth = 1,
      panelHeight = 300,
      reservedArea = 0, -- no notch; waybar auto-hides, nothing to clear
      workspaceMargin = 10,
      workspaceBorderSize = 2,
      workspaceActiveBackground = "rgba(202020ff)",
      workspaceInactiveBackground = "rgba(141414cc)",
      workspaceActiveBorder = "rgba(333333ff)",
      workspaceInactiveBorder = "rgba(262626ff)",
      centerAligned = 1,
      onBottom = 0,
      showNewWorkspace = 1,
      showEmptyWorkspace = 1,
      showSpecialWorkspace = 0, -- special tiles render empty in Hyprspace, so skip them
      exitOnClick = 1,
      exitOnSwitch = 1,
      switchOnDrop = 1,
      autoDrag = 0, -- click a window selects it; drag still moves it
      autoScroll = 1,
      hideTopLayers = 1, -- no waybar/notifications over the panel
      overrideGaps = 1,
      gapsIn = 6,
      gapsOut = 12,
    },
  },
})

if hl.plugin.overview then
  hl.bind("SUPER + grave", function()
    hl.plugin.overview.toggle()
  end, { description = "Toggle workspace overview" })
end
