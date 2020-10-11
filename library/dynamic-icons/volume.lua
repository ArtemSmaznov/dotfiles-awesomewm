local wibox = require("wibox")

local clickable_container = require('library.ui.clickable-container.no-background')

local icons = require('theme.icons')

local current_icon = icons.symbolic.volume.medium
local mute_state = false

local dynamic_icon = wibox.widget{
	{
		id = "icon",
		image = current_icon,
		resize = true,
		widget = wibox.widget.imagebox
	},
	widget = clickable_container
}

awesome.connect_signal(
	'widget::volume_icon:update',
	function(value)
		if value >= 70 then
			current_icon = icons.symbolic.volume.high
		elseif value >= 30 and value < 70 then
			current_icon = icons.symbolic.volume.medium
		elseif value > 0 and value < 30 then
			current_icon = icons.symbolic.volume.low
		elseif value <= 0 then
			current_icon = icons.symbolic.volume.muted
		end
		dynamic_icon.icon.image = current_icon
	end
)

awesome.connect_signal(
	'widget::volume_icon:mute',
	function(state)
		if state == nil then
			if mute_state then
				dynamic_icon.icon.image = current_icon
				mute_state = false
				else
					dynamic_icon.icon.image = icons.symbolic.volume.muted
				mute_state = true
				end
		elseif state == true then
			dynamic_icon.icon.image = icons.symbolic.volume.muted
			mute_state = true
		elseif state == false then
			dynamic_icon.icon.image = current_icon
			mute_state = false
		end
	end
)

return dynamic_icon