--[[

     Licensed under MIT
     * (c) 2017, Egor Churaev egor.churaev@gmail.com

--]]
local awful = require('awful')

local kbdcfg = require("widget.keyboard-layout.kbdcfg")({type = "tui"})

-- local kbdcfg = keyboard_layout({type = "tui"})

kbdcfg.add_primary_layout("English", "US", "us")
kbdcfg.add_primary_layout("Русский", "RU", "ru")

kbdcfg.add_additional_layout("Deutsch",  "DE", "de")
kbdcfg.add_additional_layout("Lithuanian", "LT", "lt")

kbdcfg.bind()

-- Mouse bindings
kbdcfg.widget:buttons(
	awful.util.table.join(
		awful.button({ }, 1, function () kbdcfg.menu:toggle() end),
		awful.button({ }, 3, function () kbdcfg.switch_next() end))
)

return awful.widget.only_on_screen(kbdcfg.widget, 'primary')
