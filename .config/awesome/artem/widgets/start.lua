local awful = require("awful")
local icons = require('themes.icons')
local wibox = require("wibox")
startMenu = require('widgets.startMenu')

local Launcher = wibox.widget{
	awful.widget.launcher({
		image = icons.arch,
		menu = startMenu
	}),
	margins = 5,
	layout = wibox.container.margin
}

return Launcher