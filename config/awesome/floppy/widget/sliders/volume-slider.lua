local wibox = require('wibox')
local beautiful = require('beautiful')
local awful = require('awful')
local gears = require('gears')

local dpi = beautiful.xresources.apply_dpi

local icon = require('widget.system-elements.volume-icon')
local volume_slider = require('widget.system-elements.volume-slider')

local volume_icon = wibox.widget {
	icon,
	top = dpi(10),
	bottom = dpi(10),
	widget = wibox.container.margin
}

volume_icon:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				awesome.emit_signal('widget::volume:mute', nil)
			end
		)
	)
)

local volume_setting = wibox.widget {
	{
		volume_icon,
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
