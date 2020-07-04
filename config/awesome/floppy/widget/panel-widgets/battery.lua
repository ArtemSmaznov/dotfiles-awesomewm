local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')

local watch = awful.widget.watch

local apps = require('configuration.apps')

local clickable_container = require('widget.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local widget = wibox.layout.fixed.horizontal()

local battery_tooltip = function(el, content)
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

local get_battery_info = function(device, widget)
	awful.spawn.easy_async_with_shell('upower -i ' .. device, function(stdout)

		battery_tooltip(widget, stdout)

	end)
end

local get_icon = function(charge, status)
	local icon
	if status:match('charging') then
		icon = 'battery_charging_'
	else
		icon = 'battery_'
	end

	if charge >= 0 and charge < 10 then icon = icon .. '0'
	elseif charge >= 10 and charge < 20 then icon = icon .. '10'
	elseif charge >= 20 and charge < 30 then icon = icon .. '20'
	elseif charge >= 30 and charge < 40 then icon = icon .. '30'
	elseif charge >= 40 and charge < 50 then icon = icon .. '40'
	elseif charge >= 50 and charge < 60 then icon = icon .. '50'
	elseif charge >= 60 and charge < 70 then icon = icon .. '60'
	elseif charge >= 70 and charge < 80 then icon = icon .. '70'
	elseif charge >= 80 and charge < 90 then icon = icon .. '80'
	elseif charge >= 90 and charge < 100 then icon = icon .. '90'
	elseif charge >= 100 then icon = icon .. '100'
	else icon = 'battery_unknown'
	end

	return icons.symbolic.battery[icon]
end


local update_widget_icon = function(widget, device)
	local check_percentage_cmd = "upower -i " .. device ..  " | grep percentage | awk '{print $2}' | tr -d '\n%'"
	local check_status_cmd = "upower -i " .. device ..  " | grep state | awk '{print $2}' | tr -d '\n'"

	awful.spawn.easy_async_with_shell(check_status_cmd, function(stdout)
		local charging_status = stdout
		awful.spawn.easy_async_with_shell(check_percentage_cmd, function(stdout)
			local battery_percentage = tonumber(stdout)
			
			widget.image = get_icon(battery_percentage, charging_status)
		end)
	end)

end

local build_widget = function()
	widget:reset()

	awful.spawn.with_line_callback('upower -e',{
		stdout = function(device)
			local check_statistics_cmd = "upower -i " .. device ..  " | grep statistics | awk '{print $3}'"
	
			awful.spawn.easy_async_with_shell(check_statistics_cmd, function(stdout)
				if stdout:match('yes') then

					local ib = wibox.widget.imagebox()
					ib.image = icons.symbolic.battery.battery_unknown				
					
					local button_widget = wibox.widget {
						{
							ib,
							margins = dpi(7),
							widget = wibox.container.margin
						},
						widget = clickable_container
					}

					button_widget:buttons(
						gears.table.join(
							awful.button(
								{},
								1,
								nil,
								function()
									awful.spawn(apps.default.power_manager , false)
								end
							)
						)
					)
				
					widget:connect_signal('mouse::enter', function()
						get_battery_info(device, button_widget)
					end)

					widget:add(button_widget)

					watch('upower -e', 5, function(w, stdout)
						if stdout == nil or stdout == '' then
							naughty.notify { text = 'output of upower -e is empty' }
						else
							update_widget_icon(ib, device)
						end
					end)
				end
			end)
		end,
		stderr = function(line)
			naughty.notify { text = "Error: "..line}
		end,
	})


end







build_widget()

awesome.connect_signal(
	'widgets:update',
	function()
		build_widget()
	end
)

awesome.connect_signal(
	'widgets:debug',
	function()
		build_widget()
	end
)

return widget