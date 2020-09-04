local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local dpi = require('beautiful').xresources.apply_dpi

local system_slider = require('theme.system.slider')
local icons = require('theme.icons')
local spawn = require('awful.spawn')

screen.connect_signal("request::desktop_decoration", function(s)

	s.show_bri_osd = false

	local slider_osd = wibox.widget {
		id 					= 'bri_osd_slider',
		widget = system_slider
	}

	local bri_osd_slider = slider_osd

	-- Update brightness level using slider value
	bri_osd_slider:connect_signal(
		'property::value',
		function()

			local brightness_level = bri_osd_slider:get_value()
			
			spawn('light -S ' .. math.max(brightness_level, 5), false)

			-- Update the brightness slider if values here change
			awesome.emit_signal('widget::brightness:update', brightness_level)

			if s.show_bri_osd then
				awesome.emit_signal(
					'module::brightness_osd:show', 
					true
				)
			end
	  	
	  	end
	)

	bri_osd_slider:connect_signal(
	  	'button::press',
	  	function()
	  		s.show_bri_osd = true
	  	end
	)
	bri_osd_slider:connect_signal(
		'button::release',
		function()
			s.show_bri_osd = false
		end
	)
	bri_osd_slider:connect_signal(
		'mouse::enter',
		function()
			s.show_bri_osd = true
		end
	)

	-- The emit will come from brightness slider
	awesome.connect_signal(
		'module::brightness_osd',
		function(brightness)
			bri_osd_slider:set_value(brightness)
		end
	)

	local osd_icon = wibox.widget {
		{
			{
				image = icons.symbolic.brightness.high,
				resize = true,
				widget = wibox.widget.imagebox
			},
			halign = 'center',
			widget = wibox.container.place
		},
		height = dpi(150),
		widget = wibox.container.constraint
	}

	-- Create the box
	local osd_margin = dpi(10)

	local osd_content = wibox.widget {
		{
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(20),
			osd_icon,
			slider_osd,
		},
		margins = dpi(20),
		widget = wibox.container.margin
	}

	s.brightness_osd_overlay = require('modules.osd_overlay')(s, osd_content)

	local hide_osd = gears.timer {
		timeout = 2,
		autostart = true,
		callback  = function()
			awful.screen.focused().brightness_osd_overlay.visible = false
		end
	}

	local timer_rerun = function()
	 	if hide_osd.started then
			hide_osd:again()
		else
			hide_osd:start()
		end
	end

  	-- Reset timer on mouse hover
	s.brightness_osd_overlay:connect_signal(
		'mouse::enter', 
		function()
			s.show_bri_osd = true
			timer_rerun()
		end
	)
	s.brightness_osd_overlay:connect_signal(
		'mouse::enter', 
		function()
			s.show_bri_osd = false
			timer_rerun()
		end
	)

	local placement_placer = function()

		local focused = awful.screen.focused()

		awful.placement.bottom(
			focused.brightness_osd_overlay, {
				margins = {
					bottom = osd_margin + dpi(50),
				},
				parent = focused
			}
		)
	end

	awesome.connect_signal(
		'module::brightness_osd:show', 
		function(bool)
			placement_placer()
			awful.screen.focused().brightness_osd_overlay.visible = bool
			if bool then
				timer_rerun()
			  	awesome.emit_signal(
			  		'module::volume_osd:show',
			  		false
			  	)
			else
				if hide_osd.started then
					hide_osd:stop()
				end
		  	end
		end
	)

end)