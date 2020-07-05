local wibox = require('wibox')
local awful = require('awful')
local naughty = require('naughty')
local gears = require('gears')

local clickable_container = require('widget.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')

local sampleText = "Hello World!"

local my_widget = wibox.widget {
	text = sampleText,
	widget = wibox.widget.textbox
}

local do_the_thing = function()
	naughty.notify { text = sampleText}

	local mypopup = awful.popup {
		widget = my_widget,
		ontop = true,
		bg = "#555",
		screen = 'primary',
		placement = awful.placement.centered
}
end

awesome.connect_signal(
	'debug',
	function ()
		-- do_the_thing()	
	end
)