local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local volume_icon = require('widget.system-elements.volume-icon')
local volume_slider = require('widget.system-elements.volume-slider')

screen.connect_signal("request::desktop_decoration", function(s)

	s.show_vol_osd = false

	volume_slider:connect_signal(
		'property::value',
		function()
			if s.show_vol_osd then
				awesome.emit_signal(
					'module::volume_osd:show',
					true
				)
			end
		end
	)

	volume_slider:connect_signal(
		'button::press',
		function()
			s.show_vol_osd = true
		end
	)
	volume_slider:connect_signal(
		'button::release',
		function()
			s.show_vol_osd = false
		end
	)
	volume_slider:connect_signal(
		'mouse::enter',
		function()
			s.show_vol_osd = true
		end
	)

	local osd_icon = wibox.widget {
		{
			volume_icon,
			halign = 'center',
			widget = wibox.container.place
		},
		height = dpi(150),
		widget = wibox.container.constraint
	}
	
	osd_icon:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				awesome.emit_signal('widget::volume:mute', nil)
			end
		)
	)
)

	-- Create the box
	local osd_height = dpi(300)
	local osd_width = dpi(300)

	local osd_margin = dpi(10)

	local osd_content = wibox.widget {
		{
			layout = wibox.layout.fixed.vertical,
			spacing = dpi(20),
			osd_icon,
			volume_slider,
		},
		margins = dpi(20),
		widget = wibox.container.margin
	}

	s.volume_osd_overlay = awful.popup {
		widget = {
			{
				osd_content,
				margins = dpi(20),
				widget = wibox.container.margin
			},
			forced_height = osd_height,
			forced_width = osd_width,
			bg = beautiful.background,
			shape = gears.shape.rounded_rect,
			widget = wibox.container.background()
		},
		ontop = true,
		visible = false,
		type = 'notification',
		screen = s,
		maximum_height = osd_height,
		maximum_width = osd_width,
		offset = dpi(5),
		shape = gears.shape.rectangle,
		bg = beautiful.transparent,
	}

	local hide_osd = gears.timer {
		timeout = 2,
		autostart = true,
		callback  = function()
			awful.screen.focused().volume_osd_overlay.visible = false
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
	s.volume_osd_overlay:connect_signal(
		'mouse::enter', 
		function()
			s.show_vol_osd = true
			timer_rerun()
		end
	)
	s.volume_osd_overlay:connect_signal(
		'mouse::leave', 
		function()
			s.show_vol_osd = false
		end
	)

	local placement_placer = function()

		local focused = awful.screen.focused()

		awful.placement.bottom(
			focused.volume_osd_overlay, {
				margins = {
					bottom = osd_margin + dpi(50),
				},
				parent = focused
			}
		)
	end

	awesome.connect_signal(
		'module::volume_osd:show', 
		function(bool)
			placement_placer()
			awful.screen.focused().volume_osd_overlay.visible = bool
			if bool then
				timer_rerun()
				awesome.emit_signal(
					'module::brightness_osd:show',
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