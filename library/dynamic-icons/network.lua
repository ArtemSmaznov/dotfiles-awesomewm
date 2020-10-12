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
  -- if nmcli is not available another way is to use [[ ip route list | grep default | awk -F' ' '{print $5}' ]]
  -- this outputs the names of currently connected interfaces like eno1, wlan0, wlp0g5ds, etc.
  -- this can be stipped to first letter and try to match to 'e' or 'w'
  -- will most likely have to use gears.timer for this as doesn't seem to work with awful.watch
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