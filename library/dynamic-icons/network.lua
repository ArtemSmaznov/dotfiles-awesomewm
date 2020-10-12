local awful = require('awful')
local wibox = require("wibox")

local icons = require('theme.icons')
local user_preferences = require('configuration.preferences')

local fallback_icon = icons.symbolic.network.wired_error

local dynamic_icon = wibox.widget{
	image = fallback_icon,
	resize = true,
	widget = wibox.widget.imagebox
}

awful.widget.watch(
  'nmcli con show --active',
  user_preferences.system.icons_update_interval,
  function(_, stdout)
    if stdout:match('ethernet') then
      dynamic_icon.image = icons.symbolic.network.wired
    elseif stdout:match('wifi') then
      dynamic_icon.image = icons.symbolic.network.wifi_on
    else
      dynamic_icon.image = icons.symbolic.network.wired_off
    end
end
)

return dynamic_icon