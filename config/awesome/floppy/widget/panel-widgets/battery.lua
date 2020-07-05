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
local cache = {}

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
			if stdout ~= nil or stdout ~= '' then
				local battery_percentage = tonumber(stdout)
				widget.image = get_icon(battery_percentage, charging_status)
			end
		end)
	end)

end

local compare_tables = function(table1, table2)
	for i, device in pairs(table2) do
		if device ~= table1[i] then
			return false
		end
	end

	return true
end

local update_widget = function(w)
	w.image = icons.symbolic.battery.battery_charging_50
end

local rebuild_widget = function (cached_devices)
	widget:reset()
	for i, device in pairs(cached_devices) do
		local check_statistics_cmd = "upower -i " .. device ..  " | grep statistics | awk '{print $3}'"

		awful.spawn.easy_async_with_shell(check_statistics_cmd, function(stdout)
			if stdout:match('yes') then
				local ib = wibox.widget {
					id = 'art',
					image = icons.symbolic.battery.battery_unknown,
					widget = wibox.widget.imagebox
				}

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
			
				get_battery_info(device, button_widget)
				button_widget:connect_signal('mouse::enter', function()
					get_battery_info(device, button_widget)
				end)

				widget:add(button_widget)
				update_widget_icon(ib, device)
			end
		end)
	end
end

gears.timer {
	timeout   = 5,
	call_now  = true,
	autostart = true,
	callback  = function()
		local devices_list = {}
		awful.spawn.with_line_callback('upower -e', {
			stdout = function(device)
				-- This is where the each device is added to list
				table.insert(devices_list, device)
			end,
			output_done = function()
				-- This is what happens after the list of devices is updated
				if compare_tables(cache, devices_list) then
					-- logic to update the widget icon
					-- update_widget(cache)

				else
					cache = devices_list
					-- logic to rebuild
					rebuild_widget(cache)
				end
			end
		})
	end
}

awesome.connect_signal(
	'widgets:update',
	function()
		rebuild_widget(cache)	
	end
)

awesome.connect_signal(
	'debug',
	function()
		rebuild_widget(cache)		
	end
)

return widget