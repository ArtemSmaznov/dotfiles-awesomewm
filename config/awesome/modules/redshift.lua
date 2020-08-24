local awful = require('awful')

local toggle_state

awesome.connect_signal(
	'module::redshift:enable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'redshift-gtk',
			function(stdout)
				return
      end
    )
	end
)

awesome.connect_signal(
	'module::redshift:disable', 
	function() 
		awful.spawn.easy_async_with_shell(
			'killall redshift',
			function(stdout)
				return
			end
		)
	end
)

awesome.connect_signal(
	'module::redshift:status:request', 
	function() 
		awful.spawn.easy_async_with_shell(
		[[
			if [ -z $(pgrep redshift) ];
			then
				echo 'OFF'
			else
				redshift -p 2> /dev/null | grep Period | awk '{print $2}'
			fi
		]],
		function(stdout)
			if stdout:match('Night') then
				toggle_state = true
			elseif stdout:match('Transition') then
				toggle_state = true
			else
				toggle_state = false
			end
			awesome.emit_signal('module::redshift:status:reply', toggle_state)
		end
	)
	end
)

