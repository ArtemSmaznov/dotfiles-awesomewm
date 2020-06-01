local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi

	return wibox.widget {
		orientation = 'horizontal',
		forced_height = dpi(1),
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}
