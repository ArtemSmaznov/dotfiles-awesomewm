local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

require('awful.autofocus')

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey

local resizingStep = dpi(40)

local clientKeys = awful.util.table.join(
-- close client
awful.key(
	{modkey}, 'q',
	function(c)
		c:kill()
	end,
	{description = 'close', group = 'client'}
),
-- Default client focus
awful.key(
	{altkey}, 'Tab',
	function()
		awful.client.focus.byidx(1)
	end,
	{description = 'focus prev/next client', group = 'client'}
),
awful.key(
	{altkey, 'Shift'}, 'Tab',
	function()
		awful.client.focus.byidx(-1)
	end,
	{description = 'focus prev/next client', group = 'client'}
),
awful.key(
	{ modkey, altkey }, 'Left',
	function ()
		awful.client.swap.byidx(-1)
	end,
	{description = "swap with prev/next client", group = "client"}
),
awful.key(
	{ modkey, altkey }, 'Right',
	function ()
		awful.client.swap.byidx(1)
	end,
	{description = "swap with prev/next client", group = "client"}
),
awful.key(
	{modkey}, '`',
	awful.client.urgent.jumpto,
	{description = 'jump to urgent client', group = 'client'}
),
-- awful.key(
-- 	{altkey},
-- 	'Tab',
-- 	function()
-- 		awful.client.focus.history.previous()
-- 		if client.focus then
-- 			client.focus:raise()
-- 		end
-- 	end,
-- 	{description = 'go back', group = 'client'}
-- ),
awful.key(
  {modkey}, 'd',
  function(c)
    c.minimized = true
  end,
  {description = "minimize client", group = 'client'}
),
-- move floating client to center
awful.key(
	{ modkey, 'Control' }, 'c',
	function(c)
		local focused = awful.screen.focused()

		awful.placement.centered(c, {
			honor_workarea = true
		})
	end,
	{description = 'move client to center of the screen', group = "client"}
),

-- toggle client floating mode
awful.key(
	{modkey}, 'f',
	function(c)
		c.fullscreen = false
    c.maximized = false
    c.maximized_vertical = false
    c.maximized_horizontal = false
		c.floating = not c.floating
		c:raise()
	end,
	{description = 'toggle floating', group = 'client'}
),
-- toggle client max mode
awful.key(
	{modkey}, 'm',
	function(c)
		c.fullscreen = false
		c.floating = false
    c.maximized = not c.maximized
    c.maximized_vertical = c.maximized
    c.maximized_horizontal = c.maximized
		c:raise()
	end,
	{description = 'toggle max', group = 'client'}
),
-- toggle client fullscreen mode
awful.key(
	{modkey}, 'F11',
	function(c)
    c.floating = false
    c.maximized = false
    c.maximized_vertical = false
    c.maximized_horizontal = false
		c.fullscreen = not c.fullscreen
		c:raise()
	end,
	{description = 'toggle fullscreen', group = 'client'}
),
-- toggle client sticky mode
awful.key(
	{modkey}, 's',
	function(c)
		c.sticky = not c.sticky
	end,
	{description = 'toggle sticky', group = 'client'}
),

-- Screen management
awful.key(
	{modkey, 'Shift'}, 'Up',
	function(c)
		-- if client.focus then
		-- 	local tag = client.focus.screen.tags[1]
		-- 	if tag then
		-- 			client.focus:move_to_tag(tag)
		-- 	end
		-- end
	end,
	{description = 'move window to tag*', group = 'client'}
),
awful.key(
	{modkey, 'Shift'}, 'Down',
	function(c)

	end,
	{description = 'move window to tag*', group = 'client'}
),
awful.key(
	{modkey, 'Shift'}, 'Left',
	function(c)
		c:move_to_screen(1)
	end,
	{description = 'move window to screen', group = 'client'}
),
awful.key(
	{modkey, 'Shift'}, 'Right',
	function(c)
		c:move_to_screen(2)
	end,
	{description = 'move window to screen', group = 'client'}
),
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

-- Resize floating clients
awful.key(
	{modkey, 'Control'}, 'Right',
	function(c)
		if c.floating then
			c:relative_move(-resizingStep, 0, 2*resizingStep, 0)
		end
	end,
	{description = 'increase floating client horizontal size', group = 'client'}
),
awful.key(
	{modkey, 'Control'}, 'Left',
	function(c)
		if c.floating and c.width > 10 then
			c:relative_move(resizingStep, 0, -2*resizingStep, 0)
		end
	end,
	{description = 'decrease floating client horizontal size', group = 'client'}
),
awful.key(
	{modkey, 'Control'}, 'Down',
	function(c)
		if c.floating then
			c:relative_move(0, -resizingStep, 0, 2*resizingStep)
		end
	end,
	{description = 'increase floating client vertical size', group = 'client'}
),
awful.key(
	{modkey, 'Control'}, 'Up',
	function(c)
		if c.floating and c.height > 10 then
			c:relative_move(0, resizingStep, 0, -2*resizingStep)
		end
	end,
	{description = 'decrease floating client vertical size', group = 'client'}
)

)
return clientKeys
