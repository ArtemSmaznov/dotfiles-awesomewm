local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

local progressbar = wibox.widget {
	{
		id            = 'music_bar',
		max_value     = 100,
		forced_height = dpi(3),
		forced_width  = dpi(100),
		color         = beautiful.system_elements,
		background_color  = beautiful.groups_bg,
		shape         = gears.shape.rounded_bar,
		widget        = wibox.widget.progressbar
	},
	layout = wibox.layout.stack
}


return progressbar
