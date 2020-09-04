local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi


local items = wibox.widget {
  require('widgets.togglers.qs-wifi'),
  require('widgets.togglers.qs-bluetooth'),
  require('widgets.togglers.qs-redshift'),
  require('widgets.togglers.qs-compositor'),
  require('widgets.togglers.qs-blur'),
  require('widgets.togglers.qs-airplane-mode'),
  -- require('widgets.panel-widgets.screen-recorder')(),
  spacing = dpi(7),
  forced_num_cols = 6,
  layout = wibox.layout.grid.vertical,
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
	bg = beautiful.groups_bg,
	shape = function(cr, width, height)
		gears.shape.partially_rounded_rect(cr, width, height, true, true, true, true, beautiful.groups_radius)
	end,
	widget = wibox.container.background
}

return panel
