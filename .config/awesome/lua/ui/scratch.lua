local bling = require("bling")

Spad = bling.module.scratchpad({
  command = "kitty --class spad",
  rule = { instance = "spad" },
  sticky = true,
  autoclose = true,
  floating = true,
  geometry = { x = 360, y = 90, height = 900, width = 1200 },
  reapply = true,
})

Pop = bling.module.scratchpad({
  command = "kitty --class pop",
  rule = { instance = "pop" },
  sticky = true,
  autoclose = true,
  floating = true,
  geometry = { x = 360, y = 90, height = 900, width = 1200 },
  reapply = true,
})

Spot = bling.module.scratchpad({
  command = "spotify",
  rule = { instance = "spotify" },
  sticky = true,
  autoclose = true,
  floating = true,
  geometry = { x = 360, y = 90, height = 900, width = 1200 },
  reapply = true,
})
