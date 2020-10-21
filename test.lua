local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local icon = wibox.widget {
  {
    image = beautiful.awesome_icon,
    resize = true,
    widget = wibox.widget.imagebox
  },
  bg = beautiful.groups_bg,
  widget = wibox.container.background
}

local grid = wibox.widget {
  icon,
  icon,
  icon,
  icon,
  icon,
  forced_num_cols = 3,
  spacing       = 5,
  horizontal_expand = true,
  vertical_expand = false,
  horizontal_homogeneous = true,
  layout = wibox.layout.grid
}

grid._private.vertical_expand = false

local wi = wibox.widget {
  grid,
  bg = beautiful.groups_bg,
  shape = function(cr, width, height)
    gears.shape.partially_rounded_rect(cr, width, height, false, false, false, false, beautiful.groups_radius)
  end,
  widget = wibox.container.background
}
local w = wibox{ x = 100, y = 50, width = 300, height = 600, visible = true, widget = wi }

return wi