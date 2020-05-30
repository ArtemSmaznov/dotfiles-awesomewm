local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", default.terminal .. " -e man awesome" },
    { "edit config", default.ide .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
 }

return awful.menu({ items = {
        { "awesomeWM", myawesomemenu, beautiful.awesome_icon },
        { "open terminal", default.terminal }
    }
})
