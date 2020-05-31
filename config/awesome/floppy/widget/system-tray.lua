local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi


return function(s, action_bar_width)
	
	s.systray = wibox.widget {
		{
			visible = true,
			base_size = dpi(30),
			horizontal = false,
			screen = 'primary',
			widget = wibox.widget.systray
		},
		margins = dpi(5),
		widget = wibox.container.margin
	}

	s.tray_toggler  = require('widget.tray-toggler')

	return wibox.widget {
		id = 'system_tray',
		layout = wibox.layout.align.vertical,
		forced_width = action_bar_width,
		s.tray_toggler,
		nil,
		s.systray
	}
end