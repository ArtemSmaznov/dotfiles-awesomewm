local awful = require('awful')

local toggle_state

awesome.connect_signal(
	'module::bluetooth:enable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'rfkill unblock bluetooth',
			function(stdout)
				return
      end
    )
	end
)

awesome.connect_signal(
	'module::bluetooth:disable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'rfkill block bluetooth',
			function(stdout)
				return
			end
		)
	end
)

awesome.connect_signal(
	'module::bluetooth:status:request', 
	function() 
		awful.spawn.easy_async_with_shell(
		'rfkill list bluetooth',
		function(stdout)
			if stdout:match('Soft blocked: no') then
				toggle_state = true
      else
        toggle_state = false
			end
			awesome.emit_signal('module::bluetooth:status:reply', toggle_state)
		end
	)
	end
)

