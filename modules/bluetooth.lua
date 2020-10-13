local awful = require('awful')

local user_preferences = require('configuration.preferences')

awful.widget.watch(
  [[
    rfkill list bluetooth
  ]],
  user_preferences.system.icons_update_interval,
  function(_, stdout)
    if stdout:match('Soft blocked: no') then
      awesome.emit_signal('icon::bluetooth:update', true)
    else
      awesome.emit_signal('icon::bluetooth:update', false)
    end
  end
)

awesome.connect_signal(
	'module::bluetooth:enable',
	function()
		awful.spawn('rfkill unblock bluetooth')
	end
)

awesome.connect_signal(
	'module::bluetooth:disable',
	function()
		awful.spawn('rfkill block bluetooth')
	end
)

awesome.connect_signal(
	'module::bluetooth:status_change',
	function()
		awful.spawn.easy_async_with_shell(
		'rfkill list bluetooth',
		function(stdout)
			if stdout:match('Soft blocked: no') then
        awesome.emit_signal('toggle::bluetooth:update', true)
      else
        awesome.emit_signal('toggle::bluetooth:update', false)
			end
		end
	)
	end
)

awesome.connect_signal(
  'notification_tray:opened',
  function ()
    awesome.emit_signal('module::bluetooth:status_change')
  end
)