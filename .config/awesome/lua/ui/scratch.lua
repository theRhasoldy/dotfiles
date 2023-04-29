local bling = require("bling")

Spad = bling.module.scratchpad({
  command = "kitty --class spad",
  rule = { class = "spad" },
  sticky = true,
  floating = true,
  geometry = { x = 360, y = 70, height = 900, width = 1200 },
  reapply = true,
})

Pop = bling.module.scratchpad({
  command = "kitty --class pop",
  rule = { class = "pop" },
  sticky = true,
  floating = true,
  geometry = { x = 580, y = 20, height = 100, width = 800 },
  reapply = true,
})

Spot = bling.module.scratchpad({
  command = "spotify",
  rule = { class = "Spotify" },
  sticky = true,
  floating = true,
  geometry = { x = 360, y = 70, height = 900, width = 1200 },
  reapply = true,
})