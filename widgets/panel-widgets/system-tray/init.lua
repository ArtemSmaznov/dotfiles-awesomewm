-- TODO
-- Calling widget from the top bar overwrites the size in the side bar
-- Might be better to move the bar sizes to the preferences file

local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local user_preferences = require('configuration.preferences')

local widgets_dpi = dpi(4)
local rotation

local build = function(s, size, orientation)
  local vertical_orientation

  if user_preferences.system_tray.orientation == 'vertical' then
    rotation = 'east'
    vertical_orientation = true
    s.separator = require('library.ui.separator')('h')
  elseif user_preferences.system_tray.orientation == 'horizontal' then
    rotation = 'north'
    vertical_orientation = false
    s.separator = require('library.ui.separator')('v')
  else
    require('naughty').notify { text = 'System Tray widget called with wrong orientation' }
    rotation = 'north'
    vertical_orientation = false
    s.separator = require('library.ui.separator')('v')
  end

  s.systray = wibox.widget {
    {
      {
        base_size = size - 2*widgets_dpi,
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

  if user_preferences.system_tray.expanded then
    awesome.emit_signal("widget::systray:toggle")
  end

  if user_preferences.system_tray.orientation == orientation then
    if vertical_orientation then
      return wibox.widget {
        id = 'system_tray',
        layout = wibox.layout.fixed.vertical,
        forced_width = size - 2*widgets_dpi,
        s.tray_toggler,
        s.separator,
        s.systray,
        s.separator
      }
    else
      return wibox.widget {
        id = 'system_tray',
        layout = wibox.layout.fixed.horizontal,
        forced_height = size,
        s.tray_toggler,
        s.separator,
        s.systray,
        s.separator,
      }
    end
  else
    return nil
  end

end

return build
