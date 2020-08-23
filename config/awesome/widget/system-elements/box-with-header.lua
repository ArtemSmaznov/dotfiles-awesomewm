local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local dpi = beautiful.xresources.apply_dpi

local header = function(type, content)
  if type == 'header' then
    return wibox.widget {
      {
        {
          text = content,
          font = 'SF Pro Text Regular 12',
          align = 'left',
          valign = 'center',
          widget = wibox.widget.textbox
        },
        left = dpi(24),
        right = dpi(24),
        widget = wibox.container.margin
      },
      bg = beautiful.groups_title_bg,
      shape = function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.groups_radius) 
      end,
      forced_height = dpi(35),
      widget = wibox.container.background
    }
  elseif type == 'body' then
    return wibox.widget {
      content,
      bg = beautiful.groups_bg,
      shape = function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.groups_radius) 
      end,
      widget = wibox.container.background
	  }
  end
end

return header