local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi


return function(s, action_bar_width)
	
	s.systray = wibox.widget {
		visible = false,
		base_size = action_bar_width,
		horizontal = false,
		screen = 'primary',
		widget = wibox.widget.systray
	}

	s.tray_toggler  = wibox.widget {
		require('widget.tray-toggler'),
		direction = 'east',
		widget = wibox.container.rotate
	}

	return wibox.widget {
		id = 'system_tray',
		layout = wibox.layout.align.vertical,
		forced_width = action_bar_width,
		s.tray_toggler,
		require('widget.separator'),
		s.systray
	}
end