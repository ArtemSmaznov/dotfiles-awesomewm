local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local spawn = awful.spawn

local clickable_container = require('library.ui.clickable-container.no-background')
local system_slider = require('theme.system.slider')

local brightness_slider = wibox.widget {
	{
		id = 'slider',
		widget = system_slider
	},
	widget = clickable_container
}

brightness_slider.slider:connect_signal(
	'property::value',
	function()

		local brightness_level = brightness_slider.slider:get_value()

		spawn('light -S ' ..
			math.max(brightness_level, 5),
			false
		)

		-- Update brightness osd
		awesome.emit_signal(
			'module::brightness_osd',
			brightness_level
		)
	end
)

brightness_slider.slider:buttons(
	gears.table.join(
		awful.button(
			{},
			4,
			nil,
			function()
				if brightness_slider.slider:get_value() > 100 then
					brightness_slider.slider:set_value(100)
					return
				end
				brightness_slider.slider:set_value(brightness_slider.slider:get_value() + 5)
			end
		),
		awful.button(
			{},
			5,
			nil,
			function()
				if brightness_slider.slider:get_value() < 0 then
					brightness_slider.slider:set_value(0)
					return
				end
				brightness_slider.slider:set_value(brightness_slider.slider:get_value() - 5)
			end
		)
	)
)


local update_slider = function()
	awful.spawn.easy_async_with_shell(
		"light -G",
		function(stdout)

			local brightness = string.match(stdout, '(%d+)')

			brightness_slider.slider:set_value(tonumber(brightness))
		end
	)
end

-- Update on startup
update_slider()

-- The emit will come from the global keybind
awesome.connect_signal(
	'widget::brightness',
	function()
		update_slider()
	end
)

-- The emit will come from the OSD
awesome.connect_signal(
	'widget::brightness:update',
	function(value)
		 brightness_slider.slider:set_value(tonumber(value))
	end
)

return brightness_slider
