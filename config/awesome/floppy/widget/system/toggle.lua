local awful = require('awful')
local gears = require("gears")
local wibox = require("wibox")

local icons = require('theme.icons')

local dpi = require('beautiful').xresources.apply_dpi

function Build()
	local toggle_state = false

	local button = wibox.widget {
		id = 'icon',
		image = icons.ui.toggle_off,
		resize = true,
		forced_height = dpi(50),
		widget = wibox.widget.imagebox
	}

	local update_imagebox = function()
		if toggle_state then
			button:set_image(icons.ui.toggle_off)
			toggle_state = false
		else
			button:set_image(icons.ui.toggle_on)
			toggle_state = true
		end
	end

	button:buttons(
	gears.table.join(
		awful.button(
			{},
			1,
			nil,
			function()
				update_imagebox()
			end
		)
	)
)

	return button
end

return Build