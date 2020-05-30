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

watch(
	[[bash -c "df -h /|grep '^/' | awk '{print $5}'"]],
	10,
  function(_, stdout)
    local space_consumed = stdout:match('(%d+)')
    slider:set_value(tonumber(space_consumed))
    collectgarbage('collect')
  end
)

harddrive_meter = wibox.widget {
	myicon(icons.sdd, 20),
	slider,
	spacing = 10,
    layout  = wibox.layout.fixed.horizontal
}


return harddrive_meter

