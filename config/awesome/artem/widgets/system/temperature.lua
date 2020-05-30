local icons = require('themes.icons')
local wibox = require("wibox")
local watch = require('awful.widget.watch')
local myicon = require('themes.UI.icon')
local myslider = require('themes.UI.slider')

local slider = wibox.widget(
	{
		widget = myslider
	}
)

local max_temp = 80
watch(
  [[bash -c "cat /sys/class/thermal/thermal_zone0/temp"]],
  1,
  function(_, stdout)
    local temp = stdout:match('(%d+)')
    slider:set_value((temp / 1000) / max_temp * 100)
    collectgarbage('collect')
  end
)

temp_monitor = wibox.widget {
	myicon(icons.temp, 20),
	slider,
	spacing = 10,
    layout  = wibox.layout.fixed.horizontal
}


return temp_monitor

