local awful = require('awful')

local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()

awesome.connect_signal(
	'module::compositor:enable',
	function()
		awful.spawn(
      'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf'
    )
	end
)

awesome.connect_signal(
	'module::compositor:disable',
	function()
		awful.spawn('killall picom')
	end
)

awesome.connect_signal(
	'module::compositor:status_change',
	function()
		awful.spawn.easy_async_with_shell(
		[[
      if [ -z $(pgrep picom) ];
      then
        echo 'OFF'
      else
        echo 'ON'
      fi
		]],
		function(stdout)
			if stdout:match('ON') then
        awesome.emit_signal('toggle::compositor:update', true)
			else
        awesome.emit_signal('toggle::compositor:update', false)
			end
		end
	)
	end
)

awesome.connect_signal(
  'notification_tray:opened',
  function ()
    awesome.emit_signal('module::compositor:status_change')
  end
)