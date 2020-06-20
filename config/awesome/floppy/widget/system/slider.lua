local gears = require("gears")
local wibox = require("wibox")

local dpi = require('beautiful').xresources.apply_dpi

function Build()
	return wibox.widget {
		bar_shape           = gears.shape.rounded_rect,
		bar_height          = dpi(10),
		bar_color           = '#ffffff20',
		bar_active_color		= '#f2f2f2',
		handle_color        = '#f2f2f2',
		critical_color			= '#ED4337',
		handle_shape        = gears.shape.circle,
		handle_width        = dpi(10),
		-- handle_border_color = '#f2f2f2',
		-- handle_border_width = dpi(1),
		maximum							= 100,
		widget	= wibox.widget.slider
	}

end

return Build