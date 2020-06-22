local wibox = require('wibox')

local vertical_orientation = true
local expanded_by_default = true
local rotation

return function(s, action_bar_size)

	if vertical_orientation then
		rotation = 'east'
		s.separator = require('widget.separator')('h')
	else
		rotation = 'north'
		s.separator = require('widget.separator')('v')
	end

	s.systray = wibox.widget {
		visible = false,
		base_size = action_bar_size,
		horizontal = not vertical_orientation,
		screen = 'primary',
		widget = wibox.widget.systray
	}

	s.tray_toggler = wibox.widget {
		require('widget.tray-toggler'),
		direction = rotation,
		widget = wibox.container.rotate
	}

	if expanded_by_default then
		awesome.emit_signal("widget::systray:toggle")
	end
	
	if vertical_orientation then
		return wibox.widget {
			id = 'system_tray',
			layout = wibox.layout.align.vertical,
			forced_width = action_bar_size,
			s.tray_toggler,
			s.separator,
			s.systray,
			s.separator
		}
	else
		return wibox.widget {
			id = 'system_tray',
			layout = wibox.layout.align.horizontal,
			forced_height = action_bar_size,
			s.tray_toggler,
			s.separator,
			s.systray,
			s.separator,
		}
	end

	
end