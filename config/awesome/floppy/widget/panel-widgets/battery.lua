local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')
local menubar = require("menubar")

local watch = awful.widget.watch

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local widget = wibox.layout.fixed.horizontal()

local battery_tooltip = function(content, el)
	return awful.tooltip{
		objects = {el},
		text = content,
		mode = 'outside',
		align = 'right',
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),
		preferred_positions = {'right', 'left', 'top', 'bottom'}
	}
end

local get_battery_info = function(device, ib)
	awful.spawn.easy_async_with_shell('upower -i ' .. device, function (stdout)

		battery_tooltip(stdout, ib)

	end)
end

local get_battery_percentage = function(value)
	local icon = 'battery_'

	if value >= 0 and value < 10 then icon = icon .. '0'
	elseif value >= 10 and value < 20 then icon = icon .. '10'
	elseif value >= 20 and value < 30 then icon = icon .. '20'
	elseif value >= 30 and value < 40 then icon = icon .. '30'
	elseif value >= 40 and value < 50 then icon = icon .. '40'
	elseif value >= 50 and value < 60 then icon = icon .. '50'
	elseif value >= 60 and value < 70 then icon = icon .. '60'
	elseif value >= 70 and value < 80 then icon = icon .. '70'
	elseif value >= 80 and value < 90 then icon = icon .. '80'
	elseif value >= 90 and value < 100 then icon = icon .. '90'
	elseif value >= 100 then icon = icon .. '100'
	else icon = icon .. 'unknown'

	end
	return icon
end

local widget_update = function()
	widget:reset()

	awful.spawn.with_line_callback('upower -e', {
		stdout = function(device)
			local check_percentage_cmd = "upower -i " .. device ..  " | grep percentage | awk '{print $2}' | tr -d '\n%'"
			local check_status_cmd = "upower -i " .. device ..  " | grep state | awk '{print $2}' | tr -d '\n'"
			local check_statistics_cmd = "upower -i " .. device ..  " | grep statistics | awk '{print $3}'"

			awful.spawn.easy_async_with_shell(check_statistics_cmd, function(stdout)
				if stdout:match('yes') then
					local ib, button_widget, icon
					ib = wibox.widget.imagebox()
					get_battery_info(device, ib)
					ib:connect_signal('mouse::enter', function()
						get_battery_info(device, ib)
					end)

					awful.spawn.easy_async_with_shell(check_percentage_cmd, function (stdout)
						local battery_percentage = tonumber(stdout)

						icon = get_battery_percentage(battery_percentage)
						ib.image = icons.symbolic.battery[icon]

						button_widget = wibox.widget {
							{
								ib,
								margins = dpi(7),
								widget = wibox.container.margin
							},
							widget = clickable_container
						}

						widget:add(button_widget)
					end)
				end
			end)
		end,

		stderr = function(line)
				naughty.notify { text = "ERR: "..line}
		end,
	})
end

widget_update()

awesome.connect_signal(
	'widgets:update',
	function()
		widget_update()
	end
)

return widget