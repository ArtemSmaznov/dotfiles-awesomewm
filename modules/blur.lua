local awful = require('awful')

local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()

awesome.connect_signal(
  'module::blur:enable',
  function()
    awful.spawn.easy_async_with_shell(
      [[bash -c "
      # Check picom if it's not running then start it
      if [ -z $(pgrep picom) ]; then
        picom -b --experimental-backends --dbus --config ]] .. config_dir .. [[configuration/picom.conf
      fi

      case enable in
        'enable')
        sed -i -e 's/method = \"none\"/method = \"dual_kawase\"/g' \"]] .. config_dir .. [[configuration/picom.conf\"
        ;;
        'disable')
        sed -i -e 's/method = \"dual_kawase\"/method = \"none\"/g' \"]] .. config_dir .. [[configuration/picom.conf\"
        ;;
      esac
      "]],
      function(stdout)
        return
      end
    )
  end
)

awesome.connect_signal(
  'module::blur:disable',
  function()
    awful.spawn.easy_async_with_shell(
      [[bash -c "
      # Check picom if it's not running then start it
      if [ -z $(pgrep picom) ]; then
        picom -b --experimental-backends --dbus --config ]] .. config_dir .. [[configuration/picom.conf
      fi

      case disable in
        'enable')
        sed -i -e 's/method = \"none\"/method = \"dual_kawase\"/g' \"]] .. config_dir .. [[configuration/picom.conf\"
        ;;
        'disable')
        sed -i -e 's/method = \"dual_kawase\"/method = \"none\"/g' \"]] .. config_dir .. [[configuration/picom.conf\"
        ;;
      esac
      "]],
      function(stdout)
        return
      end
    )
  end
)

awesome.connect_signal(
	'module::blur:status_change',
  function()
		awful.spawn.easy_async_with_shell(
      [[
        bash -c "
          grep -F 'method = \"none\";' ]] .. config_dir .. [[/configuration/picom.conf | tr -d '[\"\;\=\ ]'
        "
      ]],
      function(stdout)
        if stdout:match('methodnone') then
          awesome.emit_signal('toggle::blur:update', false)
        else
          awesome.emit_signal('toggle::blur:update', true)
        end
      end
	  )
	end
)

awesome.connect_signal(
  'notification_tray:opened',
  function ()
    awesome.emit_signal('module::blur:status_change')
  end
)