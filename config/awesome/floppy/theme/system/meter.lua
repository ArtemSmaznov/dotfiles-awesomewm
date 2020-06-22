local gears = require("gears")
local wibox = require("wibox")

local dpi = require('beautiful').xresources.apply_dpi

local colors = require('theme.colors')

function Build()
	return wibox.widget {
		bar_shape         = gears.shape.rounded_rect,
		max_value     		= 100,
		value         		= 29,
		forced_height		 	= dpi(2),
		color 			 			= colors.foreground,
		background_color 	= colors.background,
		shape 						= gears.shape.rounded_rect,
		widget	= wibox.widget.progressbar
	}

end

return Build