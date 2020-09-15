local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

local dpi = require('beautiful').xresources.apply_dpi
local clickable_container = require('widgets.system-elements.clickable-container.with-background')

local icons = require('theme.icons')


--   ▄▄▄▄▄           ▄      ▄                 
--   █    █ ▄   ▄  ▄▄█▄▄  ▄▄█▄▄   ▄▄▄   ▄ ▄▄  
--   █▄▄▄▄▀ █   █    █      █    █▀ ▀█  █▀  █ 
--   █    █ █   █    █      █    █   █  █   █ 
--   █▄▄▄▄▀ ▀▄▄▀█    ▀▄▄    ▀▄▄  ▀█▄█▀  █   █ 


-- The button in top panel

local return_button = function()

  local widget =
    wibox.widget {
    {
      id = 'icon',
      image = icons.symbolic.user,
      widget = wibox.widget.imagebox,
      resize = true
    },
    layout = wibox.layout.align.horizontal
  }

  local widget_button = wibox.widget {
    {
      widget,
      margins = dpi(7),
      widget = wibox.container.margin
    },
    widget = clickable_container
  }

  widget_button:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          awful.screen.focused().right_panel:toggle()
        end
      )
    )
  )

  return widget_button

end


return return_button