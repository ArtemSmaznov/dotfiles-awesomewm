local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local clientKeys = awful.util.table.join(

-- close client
awful.key(
	{modkey},
	'q',
	function(c)
		c:kill()
	end,
	{description = 'close', group = 'client'}
),
-- Default client focus
awful.key(
	{modkey},
	'a',
	function()
		awful.client.focus.byidx(-1)
	end,
	{description = 'focus prev/next by index', group = 'client'}
),
awful.key(
	{modkey},
	'd',
	function()
		awful.client.focus.byidx(1)
	end,
	{description = 'focus prev/next by index', group = 'client'}
),
awful.key(
	{ modkey, "Shift" },
	"a",
	function ()
		awful.client.swap.byidx(-1)
	end,
	{description = "swap with prev/next client by index", group = "client"}
),
awful.key(
	{ modkey, "Shift"  },
	"d",
	function ()
		awful.client.swap.byidx(1)
	end,
	{description = "swap with prev/next client by index", group = "client"}
),

awful.key(
	{modkey}, 
	'u', 
	awful.client.urgent.jumpto, 
	{description = 'jump to urgent client', group = 'client'}
),
awful.key(
	{altkey},
	'Tab',
	function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end,
	{description = 'go back', group = 'client'}
),
	awful.key(
			{modkey},
			'n',
			function(c)
					c.minimized = true
			end,
			{description = "minimize client", group = 'client'}
	),
-- move floating client to center
awful.key(
	{ modkey, 'Shift' }, 
	'c',
	function(c)
		local focused = awful.screen.focused()

		awful.placement.centered(c, {
			honor_workarea = true
		})
	end,
	{description = 'align a client to the center of the focused screen.', group = "client"}
),

-- toggle client floating mode
awful.key(
	{modkey},
	'f',
	function(c)
		c.fullscreen = false
		c.maximized = false
		c.floating = not c.floating
		c:raise()
	end,
	{description = 'toggle floating', group = 'client'}
),

-- toggle client max mode
awful.key(
	{modkey},
	'm',
	function(c)
		c.fullscreen = false
		c.floating = false
		c.maximized = not c.maximized
		c:raise()
	end,
	{description = 'toggle max', group = 'client'}
),
-- toggle client fullscreen mode
awful.key(
	{modkey},
	'F11',
	function(c)
		c.maximized = false
		c.fullscreen = not c.fullscreen
		c:raise()
	end,
	{description = 'toggle fullscreen', group = 'client'}
),

-- Screen management
awful.key(
	{modkey, 'Shift'},
	'Up',
	function(c)
		-- if client.focus then
		-- 	local tag = client.focus.screen.tags[1]
		-- 	if tag then
		-- 			client.focus:move_to_tag(tag)
		-- 	end
		-- end
	end,
	{description = 'move window to tag', group = 'client'}
),
awful.key(
	{modkey, 'Shift'},
	'Down',
	function(c)

	end,
	{description = 'move window to tag', group = 'client'}
),
awful.key(
	{modkey, 'Shift'},
	'Left',
	function(c)
		c:move_to_screen(2)
	end,
	{description = 'move window to screen', group = 'client'}
),
awful.key(
	{modkey, 'Shift'},
	'Right',
	function(c)
		c:move_to_screen(1)
	end,
	{description = 'move window to screen', group = 'client'}
)
-- awful.key(
-- 	{modkey},
-- 	'o',
-- 	function(c)
-- 		c:move_to_screen()
-- 	end,
-- 	{description = 'move window to different screen', group = 'client'}
-- )

-- move client position
-- awful.key(
-- 	{modkey},
-- 	'Up',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(0, dpi(-10), 0, 0)
-- 		end
-- 	end,
-- 	{description = 'move floating client up by 10 px', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey},
-- 	'Down',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(0, dpi(10), 0, 0)
-- 		end
-- 	end,
-- 	{description = 'move floating client down by 10 px', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey},
-- 	'Left',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(dpi(-10), 0, 0, 0)
-- 		end
-- 	end,
-- 	{description = 'move floating client to the left by 10 px', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey},
-- 	'Right',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(dpi(10), 0, 0, 0)
-- 		end
-- 	end,
-- 	{description = 'move floating client to the right by 10 px', group = 'client'}
-- ),

-- Increasing floating client size
-- awful.key(
-- 	{modkey, 'Shift'},
-- 	'Up',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(0, dpi(-10), 0, dpi(10))
-- 		end
-- 	end,
-- 	{description = 'increase floating client size vertically by 10 px up', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Shift'},
-- 	'Down',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(0, 0, 0, dpi(10))
-- 		end
-- 	end,
-- 	{description = 'increase floating client size vertically by 10 px down', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Shift'},
-- 	'Left',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(dpi(-10), 0, dpi(10), 0)
-- 		end
-- 	end,
-- 	{description = 'increase floating client size horizontally by 10 px left', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Shift'},
-- 	'Right',
-- 	function(c)
-- 		if c.floating then
-- 			c:relative_move(0, 0, dpi(10), 0)
-- 		end
-- 	end,
-- 	{description = 'increase floating client size horizontally by 10 px right', group = 'client'}
-- ),

-- Decreasing floating client size
-- awful.key(
-- 	{modkey, 'Control'},
-- 	'Up',
-- 	function(c)
-- 		if c.floating and c.height > 10 then
-- 			c:relative_move(0, 0, 0, dpi(-10))
-- 		end
-- 	end,
-- 	{description = 'decrease floating client size vertically by 10 px up', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Control'},
-- 	'Down',
-- 	function(c)
-- 		if c.floating then
-- 			local c_height = c.height
-- 			c:relative_move(0, 0, 0, dpi(-10))
-- 			if c.height ~= c_height and c.height > 10 then
-- 				c:relative_move(0, dpi(10), 0, 0)
-- 			end
-- 		end
-- 	end,
-- 	{description = 'decrease floating client size vertically by 10 px down', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Control'},
-- 	'Left',
-- 	function(c)
-- 		if c.floating and c.width > 10 then
-- 			c:relative_move(0, 0, dpi(-10), 0)
-- 		end
-- 	end,
-- 	{description = 'decrease floating client size horizontally by 10 px left', group = 'client'}
-- ),
-- awful.key(
-- 	{modkey, 'Control'},
-- 	'Right',
-- 	function(c)
-- 		if c.floating then
-- 			local c_width = c.width
-- 			c:relative_move(0, 0, dpi(-10), 0)
-- 			if c.width ~= c_width and c.width > 10 then
-- 				c:relative_move(dpi(10), 0 , 0, 0)
-- 			end
-- 		end
-- 	end,
-- 	{description = 'decrease floating client size horizontally by 10 px right', group = 'client'}
-- )


)
return clientKeys
