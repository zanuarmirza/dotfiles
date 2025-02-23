-- Provides:
-- evil::disk
local awful = require("awful")

local update_interval = 20
-- Returns the amount of free space in percentage
local disk_script = [[
  sh -c "
  df . | awk 'FNR==2 {print $5}'
  "]]

-- Periodically get disk info
awful.widget.watch(disk_script, update_interval, function(widget, stdout)
	local percentage = stdout
	awesome.emit_signal("evil::disk", percentage)
end)
