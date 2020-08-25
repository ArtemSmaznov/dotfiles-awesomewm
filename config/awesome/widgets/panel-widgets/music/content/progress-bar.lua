local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

local colors = require('theme.colors')

local progressbar = wibox.widget {
	{
		id            = 'music_bar',
		max_value     = 100,
		forced_height = dpi(3),
		forced_width  = dpi(100),
		color         = colors.foreground,
		background_color  = colors.background,
		shape         = gears.shape.rounded_bar,
		widget        = wibox.widget.progressbar
	},
	layout = wibox.layout.stack
}


return progressbar