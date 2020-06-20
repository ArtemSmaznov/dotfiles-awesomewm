local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local watch = awful.widget.watch
local spawn = awful.spawn

local volume_icon = require('widget.system_elements.volume_icon')

local dpi = beautiful.xresources.apply_dpi

local system_slider = require('widget.system.slider')
local icons = require('theme.icons')

local slider = wibox.widget {
	nil,
	{
		id 					= 'vol_slider',
		widget = system_slider
	},
	nil,
	expand = 'none',
	layout = wibox.layout.align.vertical
}

local volume_slider = slider.vol_slider


volume_slider:connect_signal(
	'property::value',
	function()
		local volume_level = volume_slider:get_value()
		
		spawn('amixer -D pulse sset Master ' .. 
			volume_level .. '%',
			false
		)

		-- Update volume osd
		awesome.emit_signal(
			'module::volume_osd',
			volume_level
		)

	end
)

volume_slider:buttons(
	gears.table.join(
		awful.button(
			{},
			4,
			nil,
			function()
				if volume_slider:get_value() > 100 then
					volume_slider:set_value(100)
					return
				end
				volume_slider:set_value(volume_slider:get_value() + 5)
			end
		),
		awful.button(
			{},
			5,
			nil,
			function()
				if volume_slider:get_value() < 0 then
					volume_slider:set_value(0)
					return
				end
				volume_slider:set_value(volume_slider:get_value() - 5)
			end
		)
	)
)


local update_slider = function()
	awful.spawn.easy_async_with_shell(
		[[bash -c "amixer -D pulse sget Master"]],
		function(stdout)

			local volume = string.match(stdout, '(%d?%d?%d)%%')

			volume_slider:set_value(tonumber(volume))
		end
	)

end

-- Update on startup
update_slider()

-- The emit will come from the global keybind
awesome.connect_signal(
	'widget::volume',
	function()
		update_slider()
	end
)

-- The emit will come from the OSD
awesome.connect_signal(
	'widget::volume:update',
	function(value)
		volume_slider:set_value(tonumber(value))
		if value >= 80 then
			volume_slider.bar_active_color = "#ED4337"
			volume_slider.handle_color = "#ED4337"
		elseif value <= 0 then
			volume_slider.bar_active_color = "#ffffff20"
			volume_slider.handle_color = "#ffffff00"	

		else
			volume_slider.bar_active_color = "#f2f2f2"
			volume_slider.handle_color = "#f2f2f2"
		end

		-- if value >= 70 then
		-- 	volume_icon.image = icons.symbolic.volume.high
		-- elseif value >= 30 and value < 70 then
		-- 	volume_icon.image = icons.symbolic.volume.medium
		-- elseif value > 0 and value < 30 then
		-- 	volume_icon.image = icons.symbolic.volume.low
		-- elseif value <= 0 then
		-- 	volume_icon.image = icons.symbolic.volume.muted
		-- 	volume_slider.bar_active_color = "#ffffff20"
		-- 	volume_slider.handle_color = "#ffffff00"
		-- end
	end
)

local volume_setting = wibox.widget {
	{
		{
			volume_icon,
			top = dpi(10),
			bottom = dpi(10),
			widget = wibox.container.margin
		},
		slider,
		spacing = dpi(24),
		layout = wibox.layout.fixed.horizontal

	},
	left = dpi(24),
	right = dpi(24),
	forced_height = dpi(48),
	widget = wibox.container.margin
}

return volume_setting
