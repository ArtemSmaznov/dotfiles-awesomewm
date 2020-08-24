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

require('module.notifications')
require('module.auto-start')
require('module.decorate-client')
-- require('module.backdrop')
require('module.exit-screen')
require('module.quake-terminal')
require('module.titlebar')
require('module.menu')
require('module.volume-osd')
require('module.brightness-osd')
require('module.dynamic-wallpaper')
-- require('module.battery-notifier')
require('module.lockscreen')
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
