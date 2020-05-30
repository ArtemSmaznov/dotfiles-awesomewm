local gears = require("gears")
local icons = require('themes.icons')
local wibox = require("wibox")
local watch = require('awful.widget.watch')

local slider = wibox.widget{
	max_value			= 100,
	-- value				= 90,
	forced_height		= 15,
	forced_width		= 250,
	paddings			= 3,
	color				= "#CCC",
	background_color	= "#444",
	read_only = false,
	shape				= gears.shape.rounded_bar,
	bar_shape			= gears.shape.rounded_bar,
	widget				= wibox.widget.progressbar,
}

local size = 20
local icon = wibox.widget{
	image = icons.hdd,
	forced_height = size,
	forced_width = size,
	widget = wibox.widget.imagebox
}

watch(
	[[bash -c "df -h /home/Windows|grep '^/' | awk '{print $5}'"]],
	10,
  function(_, stdout)
    local space_consumed = stdout:match('(%d+)')
    slider:set_value(tonumber(space_consumed))
    collectgarbage('collect')
  end
)

harddrive_meter = wibox.widget {
	icon,
	slider,
    layout  = wibox.layout.align.horizontal
}


return harddrive_meter

