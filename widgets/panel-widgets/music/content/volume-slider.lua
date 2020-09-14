local beautiful = require('beautiful')
local gears = require('gears')
local awful = require('awful')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

local colors = require('theme.colors')

local slider = {}

slider.vol_slider = wibox.widget {
  bar_shape           = gears.shape.rounded_rect,
  bar_height          = dpi(5),
  bar_color           = colors.foreground,
  bar_active_color  = colors.background,
  handle_color        = colors.background,
  handle_shape        = gears.shape.circle,
  handle_width        = dpi(15),
  handle_border_color = '#00000012',
  handle_border_width = dpi(1),
  maximum        = 100,
  widget              = wibox.widget.slider,
}

return slider

