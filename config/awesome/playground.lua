local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local naughty = require('naughty')
local beautiful = require('beautiful')

local clickable_container = require('widget.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')

local sampleText = "Hello World!"
local screen = 'primary'

local my_widget = wibox.widget {
	text = sampleText,
	widget = wibox.widget.textbox
}

local my_box = awful.popup {
  widget = {
    my_widget,
    forced_height = dpi(300),
    forced_width = dpi(300),
    widget = wibox.container.background()
  },
  ontop = true,
  height = dpi(300),
  bg = beautiful.transparent,
  screen = screen,
  visible = false,
  placement = awful.placement.centered
}

local do_the_thing = function()
	-- naughty.notify { text = sampleText}

	my_box.visible = not my_box.visible

end

awesome.connect_signal(
	'debug',
	function ()
		-- do_the_thing()	
	end
)