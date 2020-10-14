local wibox = require("wibox")

local icons = require('theme.icons')

local fallback_icon = icons.symbolic.network.airplane_mode_off

local dynamic_icon = wibox.widget{
	image = fallback_icon,
	resize = true,
	widget = wibox.widget.imagebox
}

awesome.connect_signal(
  'icon::airplane_mode:update',
  function (status)
    if status then
      dynamic_icon.image = icons.symbolic.network.airplane_mode_on
    else
      dynamic_icon.image = icons.symbolic.network.airplane_mode_off
    end
  end
)

return dynamic_icon