local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi

local separator

function Build(orientation)
	if orientation == 'h' then
		separator = wibox.widget {
			orientation = 'horizontal',
			forced_height = dpi(1),
			span_ratio = 0.55,
			widget = wibox.widget.separator
		}
	elseif orientation == 'v' then
		separator = wibox.widget {
			orientation = 'vertical',
			forced_width = dpi(1),
			span_ratio = 0.55,
			widget = wibox.widget.separator
		}
	end

	return separator
end


return Build
