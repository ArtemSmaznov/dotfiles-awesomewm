local wibox = require('wibox')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local vertical_orientation = true
local expanded_by_default = true
local widgets_dpi = dpi(4)
local rotation

return function(s, action_bar_size)

  if vertical_orientation then
    rotation = 'east'
    s.separator = require('library.ui.separator')('h')
  else
    rotation = 'north'
    s.separator = require('library.ui.separator')('v')
  end

  s.systray = wibox.widget {
    {
      {
        base_size = action_bar_size - 2*widgets_dpi,
        horizontal = not vertical_orientation,
        screen = 'primary',
        widget = wibox.widget.systray
      },
      margins = widgets_dpi,
      widget = wibox.container.margin
    },
    visible = false,
    bg = "#000",
    widget = wibox.container.background
  }

  s.tray_toggler = wibox.widget {
    require('widgets.panel-widgets.system-tray.tray-toggler'),
    direction = rotation,
    widget = wibox.container.rotate
  }

  if expanded_by_default then
    awesome.emit_signal("widget::systray:toggle")
  end
  
  if vertical_orientation then
    return wibox.widget {
      id = 'system_tray',
      layout = wibox.layout.fixed.vertical,
      forced_width = action_bar_size - 2*widgets_dpi,
      s.tray_toggler,
      s.separator,
      s.systray,
      s.separator
    }
  else
    return wibox.widget {
      id = 'system_tray',
      layout = wibox.layout.fixed.horizontal,
      forced_height = action_bar_size,
      s.tray_toggler,
      s.separator,
      s.systray,
      s.separator,
    }
  end

  
end