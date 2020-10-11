local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('library.ui.clickable-container.with-background')

local tasklist_buttons = {
  awful.button(
    {},
    1,
    function (c)
      c:activate {
        context = "tasklist",
        action = "toggle_minimization"
      }
    end
  ),
  awful.button(
    {},
    2,
    function(c)
      c:kill()
    end
  ),
  awful.button(
    {},
    4,
    function()
      awful.client.focus.byidx(-1)
    end
  ),
  awful.button(
    {},
    5,
    function()
      awful.client.focus.byidx( 1)
    end
  ),
}

local tasklist_style = {
  -- shape_border_width = 1,
  -- shape_border_color = '#ffffff' .. '1A',
  -- shape  = gears.shape.rounded_rect,
}

local tasklist_layout = {
  spacing = dpi(5),
  max_widget_size = dpi(250),
  layout  = wibox.layout.flex.horizontal
}

local tasklist_template = {
  {
    {
      {
        {
          id     = 'icon_role',
          widget = wibox.widget.imagebox,
        },
        {
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          margins  = dpi(5),
          widget = wibox.container.margin
        },
        layout = wibox.layout.fixed.horizontal,
      },
      margins  = dpi(5),
      widget = wibox.container.margin
    },
    widget = clickable_container
  },
  id     = 'background_role',
  widget = wibox.container.background,
}

local Build = function (s) 
  return awful.widget.tasklist {
    screen            = s,
    filter            = awful.widget.tasklist.filter.currenttags,
    buttons           = tasklist_buttons,
    style             = tasklist_style,
    layout            = tasklist_layout,
    widget_template   = tasklist_template,
  }
end

return Build
