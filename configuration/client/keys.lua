local awful = require('awful')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

require('awful.autofocus')

local mod = require('configuration.keys.mod').mod
local alt = require('configuration.keys.mod').alt
local ctrl = require('configuration.keys.mod').ctrl
local shift = require('configuration.keys.mod').shift

-- increment for moving and resizing floating windows
local step = dpi(50)

local clientKeys = awful.util.table.join(

-- ░█▀▀░█░█░█▀▀░▀█▀░█▀▀░█▄█
-- ░▀▀█░░█░░▀▀█░░█░░█▀▀░█░█
-- ░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░▀░▀

-- Awesome
awful.key({mod}, 'q', function(c)
		c:kill()
	end, {description = 'close', group = 'client'}),


-- ░█▄█░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▄░█▀▀
-- ░█░█░█░█░█░█░░█░░░█░░█░█░█▀▄░▀▀█
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀

-- Move windows between monitors
awful.key({mod, shift}, 'Left', function(c)
		c:move_to_screen(1)
	end, {description = 'move window to screen', group = 'client'}),
awful.key({mod, shift}, 'Right', function(c)
		c:move_to_screen(2)
	end, {description = 'move window to screen', group = 'client'}),


-- ░█░░░█▀█░█░█░█▀█░█░█░▀█▀░█▀▀
-- ░█░░░█▀█░░█░░█░█░█░█░░█░░▀▀█
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░░▀░░▀▀▀

-- Toggle windows states
awful.key({mod}, 'f', function(c)
		c.fullscreen = false
    c.maximized = false
    c.maximized_vertical = false
    c.maximized_horizontal = false
		c.floating = not c.floating
		c:raise()
	end, {description = 'Toggle floating', group = 'client'}),
awful.key({mod}, 'm', function(c)
		c.fullscreen = false
		c.floating = false
    c.maximized = not c.maximized
    c.maximized_vertical = c.maximized
    c.maximized_horizontal = c.maximized
		c:raise()
	end, {description = 'Toggle maximize', group = 'client'}),
awful.key({mod}, 'F11', function(c)
    c.floating = false
    c.maximized = false
    c.maximized_vertical = false
    c.maximized_horizontal = false
		c.fullscreen = not c.fullscreen
		c:raise()
	end, {description = 'Toggle fullscreen', group = 'client'}),
awful.key( {mod}, 'd', function(c)
    c.minimized = true
  end, {description = "minimize client", group = 'client'}),
awful.key({mod}, 's', function(c)
		c.sticky = not c.sticky
	end, {description = 'Toggle sticky', group = 'client'}),


-- Resize floating clients
awful.key({mod, ctrl}, 'Right', function(c)
		if c.floating then
			c:relative_move(-step, 0, 2*step, 0)
		end
	end, {description = 'resize floating client', group = 'client'}),
awful.key({mod, ctrl}, 'Left', function(c)
		if c.floating and c.width > 10 then
			c:relative_move(step, 0, -2*step, 0)
		end
	end, {description = 'resize floating client', group = 'client'}),
awful.key({mod, ctrl}, 'Up', function(c)
		if c.floating then
			c:relative_move(0, -step, 0, 2*step)
		end
	end, {description = 'resize floating client', group = 'client'}),
awful.key({mod, ctrl}, 'Down', function(c)
		if c.floating and c.height > 10 then
			c:relative_move(0, step, 0, -2*step)
		end
	end, {description = 'resize floating client', group = 'client'}),

-- Move floating clients
awful.key({mod, ctrl, shift}, 'Right', function(c)
		if c.floating then
			c:relative_move(step, 0, 0, 0)
		end
	end, {description = 'move floating client', group = 'client'}),
awful.key({mod, ctrl, shift}, 'Left', function(c)
		if c.floating and c.width > 10 then
			c:relative_move(-step, 0, 0, 0)
		end
	end, {description = 'move floating client', group = 'client'}),
awful.key({mod, ctrl, shift}, 'Up', function(c)
		if c.floating then
			c:relative_move(0, -step, 0, 0)
		end
	end, {description = 'move floating client', group = 'client'}),
awful.key({mod, ctrl, shift}, 'Down', function(c)
		if c.floating and c.height > 10 then
			c:relative_move(0, step, 0, 0)
		end
	end, {description = 'move floating client', group = 'client'})

)

return clientKeys
