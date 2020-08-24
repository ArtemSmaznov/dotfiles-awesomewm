--     ▄▄                                            ▄     ▄ ▄    ▄
--     ██  ▄     ▄  ▄▄▄    ▄▄▄    ▄▄▄   ▄▄▄▄▄   ▄▄▄  █  █  █ ██  ██
--    █  █ ▀▄ ▄ ▄▀ █▀  █  █   ▀  █▀ ▀█  █ █ █  █▀  █ ▀ █▀█ █ █ ██ █
--    █▄▄█  █▄█▄█  █▀▀▀▀   ▀▀▀▄  █   █  █ █ █  █▀▀▀▀  ██ ██▀ █ ▀▀ █
--   █    █  █ █   ▀█▄▄▀  ▀▄▄▄▀  ▀█▄█▀  █ █ █  ▀█▄▄▀  █   █  █    █
-- Banner generated using `toilet -f mono9 AwesomeWM"

local gears = require('gears')
local beautiful = require('beautiful')
require('awful.autofocus')

-- ░▀█▀░█░█░█▀▀░█▄█░█▀▀
-- ░░█░░█▀█░█▀▀░█░█░█▀▀
-- ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀
-- Banner generated using `toilet -f pagga Theme"

beautiful.init(require('theme'))

-- ░█░░░█▀█░█░█░█▀█░█░█░▀█▀
-- ░█░░░█▀█░░█░░█░█░█░█░░█░
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░░▀░

require('layout')

-- ░█▄█░█▀█░█▀▄░█░█░█░░░█▀▀░█▀▀
-- ░█░█░█░█░█░█░█░█░█░░░█▀▀░▀▀█
-- ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀

require('modules.notifications')
require('modules.auto-start')
require('modules.decorate-client')
-- require('modules.backdrop')
require('modules.exit-screen')
require('modules.quake-terminal')
require('modules.titlebar')
require('modules.menu')
require('modules.volume-osd')
require('modules.brightness-osd')
require('modules.dynamic-wallpaper')
-- require('modules.battery-notifier')
require('modules.lockscreen')
require('playground')

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░█░█░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

require('configuration.client')
require('configuration.root')
require('configuration.tags')
root.keys(require('configuration.keys.global'))

-- ░█░█░█▀█░█░░░█░░░█▀█░█▀█░█▀█░█▀▀░█▀▄
-- ░█▄█░█▀█░█░░░█░░░█▀▀░█▀█░█▀▀░█▀▀░█▀▄
-- ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░░░▀░▀░▀░░░▀▀▀░▀░▀

screen.connect_signal(
	'request::wallpaper',
	function(s)
		-- If wallpaper is a function, call it with the screen
		if beautiful.wallpaper then
			if type(beautiful.wallpaper) == 'string' then

				-- Check if beautiful.wallpaper is color/image
				if beautiful.wallpaper:sub(1, #'#') == '#' then
					-- If beautiful.wallpaper is color
					gears.wallpaper.set(beautiful.wallpaper)

				elseif beautiful.wallpaper:sub(1, #'/') == '/' then
					-- If beautiful.wallpaper is path/image
					gears.wallpaper.maximized(beautiful.wallpaper, s)
				end
			else
				beautiful.wallpaper(s)
			end
		end
	end
)
