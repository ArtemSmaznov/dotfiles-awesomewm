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
  'nmcli connection show --active',
  -- if nmcli is not available another way is to use [[ ip route list | grep default | awk -F' ' '{print $5}' ]]
  -- this outputs the names of currently connected interfaces like eno1, wlan0, wlp0g5ds, etc.
  -- this can be stipped to first letter and try to match to 'e' or 'w'
  -- will most likely have to use gears.timer for this as doesn't seem to work with awful.watch
  user_preferences.system.icons_update_interval,
  function(_, stdout)

    -- ░█░░░█▀█░█▀█
    -- ░█░░░█▀█░█░█
    -- ░▀▀▀░▀░▀░▀░▀
    if stdout:match('ethernet') then
      dynamic_icon.image = icons.symbolic.network.wired

    -- ░█░█░▀█▀░█▀▀░▀█▀
    -- ░█▄█░░█░░█▀▀░░█░
    -- ░▀░▀░▀▀▀░▀░░░▀▀▀
    elseif stdout:match('wifi') then
      awful.spawn.easy_async_with_shell(
        [[
          nmcli -t -f active,ssid,signal dev wifi | grep '^yes:' | awk -F':' '{print $3}'
        ]],
        function (stdout)
          local signal = tonumber(stdout)

          if signal ~= nil then
            if signal >= 80 then
              dynamic_icon.image = icons.symbolic.network.wifi_5
            elseif signal >= 60 and signal < 80 then
              dynamic_icon.image = icons.symbolic.network.wifi_4
            elseif signal >= 40 and signal < 60 then
              dynamic_icon.image = icons.symbolic.network.wifi_3
            elseif signal >= 20 and signal < 40 then
              dynamic_icon.image = icons.symbolic.network.wifi_2
            elseif signal >= 0 and signal < 20 then
              dynamic_icon.image = icons.symbolic.network.wifi_1
            else
              dynamic_icon.image = icons.symbolic.network.wifi_error
            end
          end
        end
      )
    else
      dynamic_icon.image = icons.symbolic.network.wired_off
    end
end
)

return dynamic_icon