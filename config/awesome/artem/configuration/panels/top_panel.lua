local awful = require('awful')
local wibox = require("wibox")
local beautiful = require('beautiful')
local app_switcher = require('widgets.app_switcher')



local TopPanel = function(s, size, offsetcondition)
    local offset = 0
    if offsetcondition == false then
        offset = 0
    else
        offset = offsetcondition
    end
    local panel =
        wibox(
            {
                screen = s,
                width = s.geometry.width - offset,
                height = size,
                x = s.geometry.x + offset,
                y = s.geometry.y,
                visible = true
            }
            
        )


    panel:struts(
        {
            top = size,
        }
    )

    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox,
            app_switcher(s)
        },
        nil, -- Middle widget
        { -- Right widgets
			layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox
        }
    }
  
    return panel
  end
  
  return TopPanel
  