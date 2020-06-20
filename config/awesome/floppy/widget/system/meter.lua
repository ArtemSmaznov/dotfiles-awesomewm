local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

function Build()
	return wibox.widget {
		bar_shape         = gears.shape.rounded_rect,
		max_value     		= 100,
		value         		= 29,
		forced_height		 	= dpi(2),
		color 			 			= beautiful.fg_normal,
		background_color 	= beautiful.groups_bg,
		shape 						= gears.shape.rounded_rect,
		widget	= wibox.widget.progressbar
	}

end

return Build