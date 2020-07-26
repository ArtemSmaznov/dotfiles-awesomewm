local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

local build = function(size)
  local widget = wibox.widget {
    {
      bg = beautiful.fg_normal,
      forced_width = dpi(size),
      forced_height = dpi(5),
      shape = gears.shape.rounded_bar,
      widget = wibox.container.background
    },
    margins = dpi(5),
    widget = wibox.container.margin
  }

  widget:connect_signal(
		'mouse::enter',
		function()
			local w = mouse.current_wibox
			if w then
				old_cursor, old_wibox = w.cursor, w
				w.cursor = 'hand1'
			end
		end
  )
  
  widget:connect_signal(
		'mouse::leave',
		function()
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
  )

  return widget
end

return build