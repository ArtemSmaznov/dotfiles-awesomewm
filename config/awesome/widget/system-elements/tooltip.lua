local awful = require('awful')

local dpi = require('beautiful').xresources.apply_dpi

local tooltip = function(widget, content)
  return awful.tooltip{
    objects = {widget},
    text = content,
    mode = 'mouse',
    align = 'top_right',
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8),
    preferred_positions = {'bottom', 'left', 'right', 'top'},
  }
end

return tooltip