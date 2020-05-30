local gears = require("gears")
local awful = require('awful')
local wibox = require("wibox")
local left_panel = require('configuration.panels.left_panel')
local top_panel = require('configuration.panels.top_panel')
local system_tray = require('configuration.panels.system_tray')

local top_panel_size = 35
local left_panel_size = 50

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()


awful.screen.connect_for_each_screen(function(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                              awful.button({}, 1,
                                           function() awful.layout.inc(1) end),
                              awful.button({}, 3,
                                           function()
            awful.layout.inc(-1)
        end), awful.button({}, 4, function() awful.layout.inc(1) end),
                              awful.button({}, 5,
                                           function()
            awful.layout.inc(-1)
        end)))


    if s.index == 1 then
      -- Create the left_panel
      s.left_panel = left_panel(s, left_panel_size, false)
      -- Create the Top bar
      s.top_panel = top_panel(s, top_panel_size, left_panel_size)
    else
      -- Create the Top bar
      s.top_panel = top_panel(s, top_panel_size, false)
      s.system_tray = system_tray(s, 350, false)
    end

end)
