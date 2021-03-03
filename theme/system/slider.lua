local gears = require("gears")
local wibox = require("wibox")
local beautiful = require('beautiful')

local dpi = require('beautiful').xresources.apply_dpi

function Build()
  return wibox.widget {
    bar_shape           = gears.shape.rounded_rect,
    bar_height          = dpi(10),
    bar_color           = beautiful.groups_bg,
    bar_active_color    = beautiful.system_elements,
    handle_color        = beautiful.system_elements,
    critical_color      = beautiful.fg_urgent,
    handle_shape        = gears.shape.circle,
    handle_width        = dpi(10),
    maximum              = 100,
    widget  = wibox.widget.slider
  }

end

return Build
