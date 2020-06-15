local awful = require('awful')
local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()

return {
	start = function ()
		awful.spawn.easy_async_with_shell(
			'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf',
			function(stdout)
				return
			end
		)
	end,
	stop = function ()
		awful.spawn.easy_async_with_shell(
			'killall picom',
			function(stdout)
				return
			end
		)
	end,
}