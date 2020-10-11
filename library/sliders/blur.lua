local awful = require('awful')
local wibox = require('wibox')

local start_up = true

local clickable_container = require('library.ui.clickable-container.no-background')
local system_slider = require('theme.system.slider')

local blur_slider = wibox.widget {
	{
		id = 'slider',
		widget = system_slider
	},
	widget = clickable_container
}

local update_slider_value = function()

	awful.spawn.easy_async_with_shell(
		[[bash -c "
		grep -F 'strength =' $HOME/.config/awesome/configuration/picom.conf | 
		awk 'NR==1 {print $3}' | tr -d ';'
		"]],
		function(stdout, stderr)
			local strength = stdout:match('%d+')
			blur_strength = tonumber(strength) / 20 * 100
			blur_slider.slider:set_value(tonumber(blur_strength))
			start_up = false
		end
	)
end

update_slider_value()

local adjust_blur = function(power)

	awful.spawn.with_shell(
		[[bash -c "
		sed -i 's/.*strength = .*/    strength = ]] .. power .. [[;/g' \
		$HOME/.config/awesome/configuration/picom.conf
		"]]
	)
end

blur_slider.slider:connect_signal(
	'property::value',
	function()
		if not start_up then
			strength = blur_slider.slider:get_value() / 50 * 10
			adjust_blur(strength)
		end
	end
)

-- Adjust slider value to change blur strength
awesome.connect_signal(
	'widget::blur:increase',
	function()

		-- On startup, the slider.value returns nil so...
		if blur_slider.slider:get_value() == nil then
			return
		end

		local blur_value = blur_slider.slider:get_value() + 10

		-- No more than 100!
		if blur_value > 100 then
			blur_slider.slider:set_value(100)
			return
		end

		blur_slider.slider:set_value(blur_value)
	end
)

-- Decrease blur
awesome.connect_signal(
	'widget::blur:decrease',
	function()

		-- On startup, the slider.value returns nil so...
		if blur_slider.slider:get_value() == nil then
			return
		end

		local blur_value = blur_slider.slider:get_value() - 10

		-- No negatives!
		if blur_value < 0 then
			blur_slider.slider:set_value(0)
			return
		end

		blur_slider.slider:set_value(blur_value)
	end
)

return blur_slider
