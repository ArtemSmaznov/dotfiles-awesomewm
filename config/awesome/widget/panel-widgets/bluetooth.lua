-------------------------------------------------
-- Bluetooth Widget for Awesome Window Manager
-- Shows the bluetooth status using the bluetoothctl command
-- Better with Blueman Manager
-------------------------------------------------

local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local watch = awful.widget.watch
local dpi = require('beautiful').xresources.apply_dpi

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container.with-background')
local icons = require('theme.icons')

local return_button = function()

	local widget =
		wibox.widget {
		{
			id = 'icon',
			image = icons.symbolic.bluetooth_off,
			widget = wibox.widget.imagebox,
			resize = true
		},
		layout = wibox.layout.align.horizontal
	}

	local widget_button = wibox.widget {
		{
			widget,
			margins = dpi(7),
			widget = wibox.container.margin
		},
		widget = clickable_container
	}

	widget_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(apps.default.bluetooth_manager, false)
				end
			)
		)
	)

	local bluetooth_tooltip = awful.tooltip
	{
		objects = {widget_button},
		mode = 'outside',
		align = 'right',
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),
		preferred_positions = {'right', 'left', 'top', 'bottom'}
	}

	watch(
		'rfkill list bluetooth', 
		5,
		function(_, stdout)
			local widget_icon_name = nil
			if stdout:match('Soft blocked: no') then
				widget_icon_name = 'bluetooth_on'
				bluetooth_tooltip.markup = 'Bluetooth is on'
      elseif not stdout:match('Soft blocked') then
          widget_icon_name = 'bluetooth_off'
          bluetooth_tooltip.markup = 'Bluetooth is unavailable'
      else
				widget_icon_name = 'bluetooth_off'
				bluetooth_tooltip.markup = 'Bluetooth is off'
			end
			widget.icon:set_image(icons.symbolic[widget_icon_name])
			collectgarbage('collect')
		end,
		widget
	)

	return widget_button

end

return return_button
