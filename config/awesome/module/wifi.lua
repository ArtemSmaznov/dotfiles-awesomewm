local awful = require('awful')

local wlan_interface = 'wlp0s20u10'

local toggle_state

awesome.connect_signal(
	'module::wifi:enable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'rfkill unblock wlan',
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
			'rfkill block wlan',
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

