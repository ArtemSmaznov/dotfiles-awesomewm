local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local colors = require('theme.colors')

function Build()
	return wibox.widget {
		bar_shape           = gears.shape.rounded_rect,
		bar_height          = dpi(10),
		bar_color           = colors.background,
		bar_active_color		= colors.foreground,
		handle_color        = colors.foreground,
		critical_color			= colors.high_level,
		handle_shape        = gears.shape.circle,
		handle_width        = dpi(10),
		maximum							= 100,
		widget	= wibox.widget.slider
	}

end

return Build