local beautiful = require('beautiful')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi

local sys_tray = wibox.widget {
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

return sys_tray