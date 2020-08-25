--[[

     Licensed under MIT
     * (c) 2017, Egor Churaev egor.churaev@gmail.com

--]]
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('widgets.system-elements.clickable-container.with-background')

local kbdcfg = require("widgets.panel-widgets.keyboard-layout.kbdcfg")({
	type = "gui",
	remember_layout = true
})


kbdcfg.add_primary_layout("English", "us", "us")
kbdcfg.add_primary_layout("Русский", "ru", "ru")

kbdcfg.add_additional_layout("Deutsch",  "de", "de")
kbdcfg.add_additional_layout("Lithuanian", "lt", "lt")

kbdcfg.bind()

-- Mouse bindings
kbdcfg.widget:buttons(
	awful.util.table.join(
		awful.button({ }, 1, function () kbdcfg.menu:toggle() end),
		awful.button({ }, 3, function () kbdcfg.switch_next() end))
)

local widget_button = wibox.widget {
	{
		kbdcfg.widget,
		margins = dpi(7),
		widget = wibox.container.margin
	},
	widget = clickable_container
}

return awful.widget.only_on_screen(widget_button, 'primary')
