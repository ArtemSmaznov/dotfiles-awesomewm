local awful = require('awful')
local wibox = require("wibox")
local beautiful = require('beautiful')
local icons = require('themes.icons')

local SystemTray = function(s, size, offsetcondition)
    local offset = 0
    if offsetcondition == false then
        offset = 0
    else
        offset = offsetcondition
    end
    local panel =
        wibox(
            {
                screen = s,
                width = s.geometry.width - offset,
                height = size,
                x = s.geometry.x + offset,
                y = s.geometry.height - size,
                visible = true
            }

        )

    panel:struts(
        {
            bottom = size,
        }
    )

	local fold = wibox.widget(
		{
			{
				{
					id     = 'icon_role',
					image = icons.arrow_down,
					align = 'center',
					forced_height = 50,
					forced_width = 50,
					widget = wibox.widget.imagebox
				},
				halign = 'center',
				layout = wibox.container.place
			},
			bg = "#333",
			widget = wibox.container.background,
		}
	)

	fold:connect_signal(
		'mouse::enter',
		function ()
			fold.bg = "#444"
		end
	)

	fold:connect_signal(
		'mouse::leave',
		function ()
			fold.bg = "#333"
		end
	)


	local hardwareMonitor = wibox.widget(
		{
			{
				text = 'Hardware monitor',
				font = 'Roboto medium 12',
				align = 'center',
				widget = wibox.widget.textbox
			},
			require('widgets.system.temperature'),
			require('widgets.system.homedrive-meter'),
			require('widgets.system.rootdrive-meter'),
			spacing = 20,
			layout = wibox.layout.grid
		}
	)

	local quickSettings = wibox.widget(
		{
			{
				text = 'Quick Settings',
				font = 'Roboto medium 12',
				align = 'center',
				widget = wibox.widget.textbox
			},
			require('widgets.audio.volume'),
			spacing = 20,
			layout = wibox.layout.grid
		}
	)

	local content = wibox.widget(
		{
			{
				hardwareMonitor,
				quickSettings,
				spacing = 20,
				forced_num_cols = 2,
				layout = wibox.layout.grid
			},
			top = 10,
			left = 20,
			layout = wibox.container.margin
		}
	)

	local revealedState = true

	fold:connect_signal(
		'button::release',
		function ()
			if revealedState == true then
				fold:get_children_by_id('icon_role')[1].image = icons.arrow_up
				content.visible = false
				panel.height = fold:get_children_by_id('icon_role')[1].forced_height
				panel.y = s.geometry.height - fold:get_children_by_id('icon_role')[1].forced_height
				revealedState = false
			else
				fold:get_children_by_id('icon_role')[1].image = icons.arrow_down
				content.visible = true
				panel.height = size
				panel.y = s.geometry.height - size
				revealedState = true
			end
		end
	)

	panel:setup {
		fold,
		content,
		layout = wibox.layout.align.vertical
	}

    return panel
end

return SystemTray
