local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('library.ui.clickable-container.with-background')
local user_preferences = require('configuration.preferences')
local icons = require('theme.icons')

local tag_list = require('widgets.panel-widgets.tag-list')

return function(s, panel, action_bar_width)

	local home_button = wibox.widget {
		{
			{
        {
          image = icons.other.shutdown,
          resize = true,
          widget = wibox.widget.imagebox
        },
        margins = dpi(10),
        widget = wibox.container.margin
      },
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
					awesome.emit_signal("module::exit_screen_show")
        end
			)
		)
	)

	panel:connect_signal(
		'opened',
		function()
			awesome.emit_signal('widget::toggles:update')
			awesome.emit_signal('widget::sliders:update')
		end
	)

	panel:connect_signal(
		'closed',
		function()
			awesome.emit_signal('widget::toggles:update')
			awesome.emit_signal('widget::sliders:update')
		end
	)

	return wibox.widget {

		id = 'action_bar',
		layout = wibox.layout.align.vertical,
		forced_width = action_bar_width,
		{
			require('widgets.panel-widgets.start')(),
			require('library.ui.separator')('h'),
			tag_list(s),
			require('library.ui.separator')('h'),
			require("widgets.panel-widgets.xdg-folders"),
			require('library.ui.separator')('h'),
			layout = wibox.layout.fixed.vertical,
		},
		nil,
		{
      require('widgets.panel-widgets.system-tray')(s, 'vertical'),
			home_button,
			layout = wibox.layout.fixed.vertical,
		}
	}
end
