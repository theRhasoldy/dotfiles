local awful = require("awful")

awful.spawn.with_shell(
  'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
  .. 'xrdb -merge <<< "awesome.started:true";'
  -- list each of your autostart commands, followed by ; inside double quotes, followed by ..
  .. "dex --environment Awesome --autostart;"
  .. "lxsession &"
  .. "xset r rate 150 60"
)
