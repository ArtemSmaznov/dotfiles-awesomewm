local wibox = require('wibox')

local icons = require('theme.icons')

local mute_state = false

local volume_icon = wibox.widget{
	image = icons.symbolic.volume.medium,
	resize = true,
	widget = wibox.widget.imagebox
}

awesome.connect_signal(
	'module::volume_icon:update',
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

awesome.connect_signal(
	'module::volume:mute',
	function(state)
		if state == nil then
			if mute_state then
				awesome.emit_signal('widget::volume')
				mute_state = false
			else
				volume_icon.image = icons.symbolic.volume.muted
				mute_state = true
			end
		elseif state == true then
			volume_icon.image = icons.symbolic.volume.muted
			mute_state = true
		elseif state == false then
			awesome.emit_signal('widget::volume')
			mute_state = false
		end
	end
)

return volume_icon