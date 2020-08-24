local awful = require('awful')

local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()

local toggle_state

awesome.connect_signal(
	'module::compositor:enable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf',
			function(stdout)
				return
      end
    )
	end
)

awesome.connect_signal(
	'module::compositor:disable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'killall picom',
			function(stdout)
				return
			end
		)
	end
)

awesome.connect_signal(
	'module::compositor:status:request', 
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
				toggle_state = true
			else
				toggle_state = false
			end
			awesome.emit_signal('module::compositor:status:reply', toggle_state)
		end
	)
	end
)

