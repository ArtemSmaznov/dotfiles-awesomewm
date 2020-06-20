local wibox = require('wibox')

local icons = require('theme.icons')

	local volume_icon = wibox.widget{
		image = icons.symbolic.volume.medium,
		resize = true,
		widget = wibox.widget.imagebox
	}

	awesome.connect_signal(
		'module::volume_osd',
		function(value)
			if value >= 70 then
				volume_icon.image = icons.symbolic.volume.high
			elseif value >= 30 and value < 70 then
				volume_icon.image = icons.symbolic.volume.medium
			elseif value > 0 and value < 30 then
				volume_icon.image = icons.symbolic.volume.low
			elseif value <= 0 then
				volume_icon.image = icons.symbolic.volume.muted
			end
		end
	)


return volume_icon