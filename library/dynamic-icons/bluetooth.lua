local wibox = require("wibox")

local clickable_container = require('library.ui.clickable-container.no-background')

local icons = require('theme.icons')

local current_icon = icons.symbolic.bluetooth_on
local mute_state = false

local dynamic_icon = wibox.widget{
	image = current_icon,
	resize = true,
	widget = wibox.widget.imagebox
}

-- awesome.connect_signal(
-- 	'widget::bluetooth_icon:update',
-- 	function()
	
		
-- 		dynamic_icon.icon.image = current_icon
-- 	end
-- )

return dynamic_icon