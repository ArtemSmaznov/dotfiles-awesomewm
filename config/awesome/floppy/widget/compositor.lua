local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

local dpi = require('beautiful').xresources.apply_dpi
local clickable_container = require('widget.window-effects.clickable-container')
local compositor = require('module.compositor')

local icons = require('theme.icons')

local toggle_state = true

local action_name = wibox.widget {
	text = 'Compositor',
	font = 'SF Pro Text Regular 11',
	align = 'left',
	widget = wibox.widget.textbox
}

local button_widget = wibox.widget {
	{
		id = 'icon',
		image = icons.toggled_off,
		widget = wibox.widget.imagebox,
		resize = true
	},
	layout = wibox.layout.align.horizontal
}

local widget_button = wibox.widget {
	{
		button_widget,
		top = dpi(7),
		bottom = dpi(7),
		widget = wibox.container.margin
	},
	widget = clickable_container
}


local update_imagebox = function()
	local button_icon = button_widget.icon
	if toggle_state then
		button_icon:set_image(icons.toggled_on)
	else
		button_icon:set_image(icons.toggled_off)
	end
end

update_imagebox()

local toggle_action = function()
	if toggle_state then
		compositor.stop()
		toggle_state = false
	else
		compositor.start()
		toggle_state = true
	end

	update_imagebox()

end

widget_button:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				toggle_action()
			end
		)
	)
)

local action_widget =  wibox.widget {
	{
		action_name,
		nil,
		{
			widget_button,
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	},
	left = dpi(24),
	right = dpi(24),
	forced_height = dpi(48),
	widget = wibox.container.margin
}

awesome.connect_signal(
	'widget::compositor:toggle',
	function() 
		toggle_action()
	end
)

awesome.connect_signal(
	'widget::compositor:update',
	function()

		update_imagebox()
	end
)

return action_widget
