local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local items = wibox.widget {
	layout = wibox.layout.fixed.horizontal,
	spacing = dpi(5),
	require('widget.panel-widgets.screen-recorder')(),
}

local panel = wibox.widget {
	{
		{
			expand = "none",
			layout = wibox.layout.align.horizontal,
			nil,
			items,
			nil
		},
		margins = dpi(10),
		widget = wibox.container.margin,
	},
	forced_height = dpi(92),
	bg = beautiful.groups_bg,
	shape = function(cr, width, height)
		gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.groups_radius)
	end,
	widget = wibox.container.background
}

return panel
