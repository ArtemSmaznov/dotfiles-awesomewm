local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')

local dpi = beautiful.xresources.apply_dpi

function Build(s)
	return awful.widget.calendar_popup.month({
		start_sunday      = false,
		spacing           = dpi(5),
		font              = 'SF Pro Text Regular 10',
		long_weekdays     = true,
		margin            = dpi(15),
		screen            = s,
		style_month       = { 
			border_width    = dpi(0), 
			padding         = dpi(20),
			shape           = function(cr, width, height)
				gears.shape.rectangle(
					cr, width, height)
			end
		},  
		style_header      = { 
			border_width    = 1, 
			bg_color        = beautiful.transparent
		},
		style_weekday     = { 
			border_width    = 1, 
			bg_color        = beautiful.transparent
		},

		style_normal      = { 
			border_width    = 0, 
			bg_color        = beautiful.transparent
		},
		style_focus       = { 
			border_width    = dpi(0), 
			border_color    = beautiful.fg_normal, 
			-- bg_color        = beautiful.groups_bg, 
			shape           = function(cr, width, height)
				gears.shape.partially_rounded_rect(
					cr, width, height, true, true, true, true, dpi(4))
			end,
		},
	})
end

return Build
