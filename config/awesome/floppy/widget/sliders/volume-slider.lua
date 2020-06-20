local wibox = require('wibox')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local volume_icon = require('widget.system_elements.volume_icon')
local volume_slider = require('widget.system_elements.volume_slider')

local volume_setting = wibox.widget {
	{
		{
			volume_icon,
			top = dpi(10),
			bottom = dpi(10),
			widget = wibox.container.margin
		},
		volume_slider,
		spacing = dpi(24),
		layout = wibox.layout.fixed.horizontal

	},
	left = dpi(24),
	right = dpi(24),
	forced_height = dpi(48),
	widget = wibox.container.margin
}

return volume_setting
