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

-- Excellent >= -80
-- Good -80 to -90
-- Mid -90 to -100
-- Bad <-100

watch(
	[[bash -c "iw dev wlp0s20u6 link | grep signal | awk '{print $2}'"]],
	1,
  function(_, stdout)
    local value = stdout:match('(%d+)')
    slider:set_value(-value)
    collectgarbage('collect')
  end
)

temp_monitor = wibox.widget {
	myicon(icons.temp, 20),
	slider,
    layout  = wibox.layout.align.horizontal
}


return temp_monitor

