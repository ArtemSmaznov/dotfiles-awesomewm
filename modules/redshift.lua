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
          echo 'ON'
        fi
      ]],
      function(stdout)
        if stdout:match('ON') then
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