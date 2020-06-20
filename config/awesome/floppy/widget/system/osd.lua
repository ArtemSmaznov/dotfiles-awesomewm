local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local osd_height = dpi(300)
local osd_width = dpi(300)
local osd_margin = dpi(10)

function Build(widget, s)
	local volume_osd = awful.popup {
		widget = {
			{
				{
					widget,
					spacing = dpi(20),
					layout = wibox.layout.fixed.vertical,
				},
				margins = dpi(20),
				widget = wibox.container.margin
			},
			forced_height = osd_height,
			forced_width = osd_width,
			bg = beautiful.background,
			shape = gears.shape.rounded_rect,
			widget = wibox.container.background()
		},
		ontop = true,
		visible = false,
		type = 'notification',
		screen = s,
		maximum_height = osd_width,
		maximum_width = osd_width,
		offset = dpi(5),
		shape = gears.shape.rectangle,
		bg = beautiful.transparent,
	}

	return awful.placement.bottom(
		volume_osd,
		{
			margins = {
				bottom = osd_margin + dpi(50),
			}
		}
	)

end

return Build