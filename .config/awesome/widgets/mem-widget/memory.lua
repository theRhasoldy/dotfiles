local wibox = require("wibox")
local timer = require("gears.timer")
local gmatch, lines, floor = string.gmatch, io.lines, math.floor

-- Memory usage (ignoring caches)
-- lain.widget.mem

timer_table = {}

function newtimer(name, timeout, fun, nostart, stoppable)
  if not name or #name == 0 then
    return
  end
  name = (stoppable and name) or timeout
  if not timer_table[name] then
    timer_table[name] = timer({ timeout = timeout })
    timer_table[name]:start()
  end
  timer_table[name]:connect_signal("timeout", fun)
  if not nostart then
    timer_table[name]:emit_signal("timeout")
  end
  return stoppable and timer_table[name]
end

local function factory(args)
  args = args or {}

  local mem = { widget = args.widget or wibox.widget.textbox() }
  local timeout = args.timeout or 2
  local settings = args.settings or function()
      end

  function mem.update()
    mem_now = {}
    for line in lines("/proc/meminfo") do
      for k, v in gmatch(line, "([%a]+):[%s]+([%d]+).+") do
        if k == "MemTotal" then
          mem_now.total = floor(v / 1024 + 0.5)
        elseif k == "MemFree" then
          mem_now.free = floor(v / 1024 + 0.5)
        elseif k == "Buffers" then
          mem_now.buf = floor(v / 1024 + 0.5)
        elseif k == "Cached" then
          mem_now.cache = floor(v / 1024 + 0.5)
        elseif k == "SwapTotal" then
          mem_now.swap = floor(v / 1024 + 0.5)
        elseif k == "SwapFree" then
          mem_now.swapf = floor(v / 1024 + 0.5)
        elseif k == "SReclaimable" then
          mem_now.srec = floor(v / 1024 + 0.5)
        end
      end
    end

    mem_now.used = mem_now.total - mem_now.free - mem_now.buf - mem_now.cache - mem_now.srec
    mem_now.swapused = mem_now.swap - mem_now.swapf
    mem_now.perc = math.floor(mem_now.used / mem_now.total * 100)

    widget = mem.widget
    settings()
  end

  newtimer("mem", timeout, mem.update)

  return mem
end

return factory
