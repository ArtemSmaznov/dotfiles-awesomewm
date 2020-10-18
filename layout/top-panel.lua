local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('library.ui.clickable-container.with-background')
local user_preferences = require('configuration.preferences')
local icons = require('theme.icons')

local task_list = require('widgets.panel-widgets.task-list')

local panelSize = dpi(40)

local TopPanel = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(45)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = panelSize,
		width = s.geometry.width - offsetx,
		x = s.geometry.x + offsetx,
		y = s.geometry.y,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal
	}


	panel:struts
	{
		top = panelSize
	}


	panel:connect_signal(
		'mouse::enter',
		function()
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end

	)


	s.add_button = wibox.widget {
		{
			{
				{
					{
						image = icons.ui.plus,
						resize = true,
						widget = wibox.widget.imagebox
					},
					-- margins = dpi(4),
					widget = wibox.container.margin
				},
				widget = clickable_container
			},
			bg = beautiful.transparent,
			shape = gears.shape.circle,
			widget = wibox.container.background
		},
		margins = dpi(4),
		widget = wibox.container.margin
	}

	s.add_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(
						awful.screen.focused().selected_tag.default_app,
						{
							tag = mouse.screen.selected_tag,
							placement = awful.placement.bottom_right
						}
					)
				end
			)
		)
	)

	s.clock_widget = wibox.widget.textclock(
    '<span font="SF Pro Text Bold 11">'
    .. user_preferences.formatting.time_short
    ..'</span>',
		1
	)

	s.clock_widget = wibox.widget {
		{
			s.clock_widget,
			margins = dpi(7),
			widget = wibox.container.margin
		},
		widget = clickable_container
	}


	s.clock_widget:connect_signal(
		'mouse::enter',
		function()
			local w = mouse.current_wibox
			if w then
				old_cursor, old_wibox = w.cursor, w
				w.cursor = 'hand1'
			end
		end
	)


	s.clock_widget:connect_signal(
		'mouse::leave',
		function()
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

	s.month_calendar = require('modules.calendar')(s)

	s.month_calendar:attach(
		s.clock_widget,
		'tr',
		{
			on_pressed = true,
			on_hover = false
		}
	)

	s.volume_widget = wibox.widget {
		{
      require('library.dynamic-icons.volume'),
      margins = dpi(7),
      widget = wibox.container.margin
		},
		widget = clickable_container
	}

	s.volume_widget:buttons(
		gears.table.join(
			awful.button(
				{},
				3,
				nil,
				function()
					awful.spawn('cinnamon-settings sound')
				end
			)
		)
	)

  s.notif_launcher = require('library.ui.launcher-line')(120)

  s.notif_launcher:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        function()
          local focused = awful.screen.focused()
          focused.notif_tray:toggle()
        end
      )
    )
  )

  s.bluetooth_status = wibox.widget {
    require('library.dynamic-icons.bluetooth'),
    margins = dpi(7),
    widget = wibox.container.margin
  }

  s.network_status = wibox.widget {
    require('library.dynamic-icons.network'),
    margins = dpi(7),
    widget = wibox.container.margin
  }

  s.wifi_status = wibox.widget {
    require('library.dynamic-icons.wifi'),
    margins = dpi(7),
    widget = wibox.container.margin
  }

  s.status_icons = wibox.widget {
    {
      s.bluetooth_status,
      s.network_status,
      s.wifi_status,
      layout = wibox.layout.fixed.horizontal,
    },
    require('library.ui.separator')('v'),
    spacing = dpi(2),
    layout = wibox.layout.fixed.horizontal,
  }

	local tray_widgets = wibox.widget {
		{
      s.status_icons,
      -- require('widgets.panel-widgets.system-tray')(s, panelSize, 'horizontal'),
			require('widgets.panel-widgets.keyboard-layout'),
			-- require('widgets.panel-widgets.music')(),
			require('widgets.panel-widgets.package-updater')(),
			s.volume_widget,
			require('widgets.panel-widgets.battery'),
			require('widgets.panel-widgets.network')(),
			spacing = dpi(2),
			layout = wibox.layout.fixed.horizontal,
		},
		margins = dpi(0),
		widget = wibox.container.margin
	}

	panel : setup {
    {
      layout = wibox.layout.align.horizontal,
      expand = "none",
      {
        layout = wibox.layout.fixed.horizontal,
        require('widgets.panel-widgets.layouts')(s),
        task_list(s),

        s.add_button
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(2),
        tray_widgets,
        s.clock_widget,
        require('widgets.panel-widgets.right-panel-opener')()
      }
    },
    {
      {
        nil,
        s.notif_launcher,
        nil,
        expand = "none",
        layout = wibox.layout.align.horizontal,
      },
      nil,
      nil,
      expand = "none",
      layout = wibox.layout.align.vertical,
    },
    layout = wibox.layout.stack
	}

	return panel
end

return TopPanel
