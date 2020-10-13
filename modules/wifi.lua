local awful = require('awful')

local user_preferences = require('configuration.preferences')

awful.widget.watch(
  [[
    bash -c "nmcli -t -f active,ssid,signal dev wifi | grep '^yes:' | awk -F':' '{print $3}'"
  ]],
  user_preferences.system.icons_update_interval,
  function(_, stdout)
    local signal = tonumber(stdout)
    awesome.emit_signal('icon::wifi:update', signal)
  end
)

awesome.connect_signal(
  'module::wifi:enable',
  function()
    awful.spawn('nmcli radio wifi on')
  end
)

awesome.connect_signal(
  'module::wifi:disable',
  function()
    awful.spawn('nmcli radio wifi off')
  end
)

awesome.connect_signal(
  'module::wifi:status_change',
  function()
    awful.spawn.easy_async_with_shell(
      'nmcli radio wifi',
      function(stdout)
        if stdout:match('enabled') then
          awesome.emit_signal('toggle::wifi:update', true)
        elseif stdout:match('disabled') then
          awesome.emit_signal('toggle::wifi:update', false)
        else
          require('naughty').notify {
            text = 'unexpected wifi state returned by nmcli: ' .. stdout
          }
        end
      end
    )
  end
)

awesome.connect_signal(
  'notification_tray:opened',
  function ()
    awesome.emit_signal('module::wifi:status_change')
  end
)