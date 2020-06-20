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


return volume_slider