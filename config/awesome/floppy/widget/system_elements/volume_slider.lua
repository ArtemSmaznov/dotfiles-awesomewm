local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local clickable_container = require('widget.clickable-container')
local system_slider = require('widget.system.slider')
local spawn = require('awful.spawn')

local volume_slider = wibox.widget {
	id 					= 'vol_osd_slider',
	widget = system_slider
}

local slider_color_high = volume_slider.critical_color
local slider_color_default = volume_slider.bar_active_color
local slider_color_muted = volume_slider.bar_color

local dynamic_updates = function(volume)
	if volume >= 80 then
		volume_slider.bar_active_color = slider_color_high
		volume_slider.handle_color = slider_color_high
	elseif volume <= 0 then
		volume_slider.bar_active_color = slider_color_muted
		volume_slider.handle_color = '#00000000'
	else
		volume_slider.bar_active_color = slider_color_default
		volume_slider.handle_color = slider_color_default
	end

	awesome.emit_signal('module::volume_icon:update', volume)
end

local update_slider = function()
	awful.spawn.easy_async_with_shell(
		[[bash -c "amixer -D pulse sget Master"]],
		function(stdout)

			local volume = tonumber(string.match(stdout, '(%d?%d?%d)%%'))

			volume_slider:set_value(volume)
			dynamic_updates(volume)
		end
	)
end

-- Controll the slider with direct clicking
volume_slider:connect_signal(
	'property::value',
	function()
		local volume = volume_slider:get_value()
		spawn('amixer -D pulse sset Master ' .. volume .. '% unmute', false)
		-- awesome.emit_signal('module::volume:mute', false)
		awesome.emit_signal('module::volume_icon:update', volume)
		dynamic_updates(volume)
	end
)

-- Controll the slider with the scroll wheel
volume_slider:buttons(
	gears.table.join(
		awful.button(
			{},
			4,
			nil,
			function()
				local volume = volume_slider:get_value()
				if volume > 100 then
					volume_slider:set_value(100)
					return
				end
				volume_slider:set_value(volume + 5)
				dynamic_updates(volume)
				awesome.emit_signal('module::volume:mute', false)
			end
		),
		awful.button(
			{},
			5,
			nil,
			function()
				local volume = volume_slider:get_value()
				if volume < 0 then
					volume_slider:set_value(0)
					return
				end
				volume_slider:set_value(volume - 5)
				dynamic_updates(volume)
				awesome.emit_signal('module::volume:mute', false)
			end
		)
	)
)

-- Controll the slider with keyboard shortcuts
awesome.connect_signal(
	'widget::volume',
	function()
		update_slider()
	end
)

-- Update the slider when opening the side panel
awesome.connect_signal(
	'widget::sliders:update',
	function()
		update_slider()
	end
)

-- Update on startup
update_slider()

return volume_slider