local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')

local dpi = beautiful.xresources.apply_dpi
local icon = require('theme.icons')

local tag_list = require('widget.tag-list')
local clickable_container = require('widget.clickable-container')

return function(s, panel, action_bar_width)

	local menu_icon = wibox.widget {
		{
			id = 'menu_btn',
			image = icon.menu,
			resize = true,
			widget = wibox.widget.imagebox
		},
		margins = dpi(10),
		widget = wibox.container.margin
	}
	
	local home_button = wibox.widget {
		{
			menu_icon,
			widget = clickable_container
		},
		bg = beautiful.background .. '66',
		widget = wibox.container.background
	}

	home_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					panel:toggle()
				end
			)
		)
	)

	panel:connect_signal(
		'opened',
		function()
			menu_icon.menu_btn:set_image(gears.surface(icon.close_small))
		end
	)

	panel:connect_signal(
		'closed',
		function()
			menu_icon.menu_btn:set_image(gears.surface(icon.menu))
		end
	)

	local separator =  wibox.widget {
		orientation = 'horizontal',
		forced_height = dpi(1),
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}

	return wibox.widget {

		id = 'action_bar',
		layout = wibox.layout.align.vertical,
		forced_width = action_bar_width,
		{
			require('widget.search-apps')(),
			separator,
			tag_list(s),
			separator,
			require("widget.xdg-folders"),
			separator,
			layout = wibox.layout.fixed.vertical,
		},
		nil,
		{
			require('widget.system-tray')(s, action_bar_width),
			separator,
			home_button,
			layout = wibox.layout.fixed.vertical,
		}
	}
end
