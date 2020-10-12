local awful = require('awful')

local user_preferences = require('configuration.preferences')

local wlan_interface = 'wlp0s20u10'

awful.spawn.easy_async_with_shell(
  'iw dev | grep Interface | cut -f 2 -d " "',
  function(stdout)
    wlan_interface = stdout
  end
)

-- awesome.connect_signal(
--   'debug',
--   function ()
--     naughty.notify { text = wlan_interface }
--   end
-- )

awful.spawn.easy_async_with_shell(
  "iw dev | grep Interface | awk '{print $2}'",
  function(stdout)
    wlan_interface = stdout
  end
)

local toggle_state

awful.widget.watch(
  [[
    bash -c "nmcli -t -f active,ssid,signal dev wifi | grep '^yes:' | awk -F':' '{print $3}'"
  ]],
  user_preferences.system.icons_update_interval,
  function(_, stdout)
    local signal = tonumber(stdout)
    awesome.emit_signal('icon::wifi:update', signal)

    if signal ~= nil then
      awesome.emit_signal('toggle::wifi:update', true)
    else
      awesome.emit_signal('toggle::wifi:update', false)
    end
  end
)

awesome.connect_signal(
  'module::wifi:enable',
  function()
    awful.spawn.easy_async_with_shell(
      'nmcli radio wifi on',
      function(stdout)
        return
      end
    )
  end
)

awesome.connect_signal(
  'module::wifi:disable',
  function()
    awful.spawn.easy_async_with_shell(
      'nmcli radio wifi off',
      function(stdout)
        return
      end
    )
  end
)

awesome.connect_signal(
  'module::wifi:status:request',
  function()
    awful.spawn.easy_async_with_shell(
    [[
      iw dev ]] .. wlan_interface .. [[ link
    ]],
    function(stdout)
      if stdout:match('SSID') then
        toggle_state = true
      else
        toggle_state = false
      end
      awesome.emit_signal('module::wifi:status:reply', toggle_state)
    end
  )
  end
)

