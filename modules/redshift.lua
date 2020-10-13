local awful = require('awful')

awesome.connect_signal(
	'module::redshift:enable',
	function()
		awful.spawn('redshift-gtk')
	end
)

awesome.connect_signal(
	'module::redshift:disable',
	function()
		awful.spawn('killall redshift')
	end
)

awesome.connect_signal(
	'module::redshift:status_change',
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
          awesome.emit_signal('toggle::redshift:update', true)
        elseif stdout:match('Transition') then
          awesome.emit_signal('toggle::redshift:update', true)
        else
          awesome.emit_signal('toggle::redshift:update', false)
        end
      end
	  )
	end
)

awesome.connect_signal(
  'notification_tray:opened',
  function ()
    awesome.emit_signal('module::redshift:status_change')
  end
)