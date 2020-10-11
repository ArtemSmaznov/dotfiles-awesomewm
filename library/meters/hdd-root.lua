local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local watch = require('awful.widget.watch')

local system_meter = require('theme.system.meter')
local icons = require('theme.icons')

local dpi = beautiful.xresources.apply_dpi

local slider = wibox.widget {
	nil,
	{
		id 				 = 'hdd_usage',
		widget        	 = system_meter
	},
	nil,
	expand = 'none',
	layout = wibox.layout.align.vertical
}

watch(
	[[bash -c "df -h /|grep '^/' | awk '{print $5}'"]],
	10,
	function(_, stdout)
		local space_consumed = stdout:match('(%d+)')
		slider.hdd_usage:set_value(tonumber(space_consumed))
		collectgarbage('collect')
	end
)


local hdd_meter = wibox.widget {
	{
		{
			{
				image = icons.symbolic.sdd,
				resize = true,
				widget = wibox.widget.imagebox
			},
			top = dpi(12),
			bottom = dpi(12),
			widget = wibox.container.margin
		},
		{
			text = 'root',
			forced_width = dpi(38),
			align = 'left',
			widget = wibox.widget.textbox
		},
		slider,
		spacing = dpi(24),
		layout = wibox.layout.fixed.horizontal

	},
	left = dpi(24),
	right = dpi(24),
	forced_height = dpi(48),
	widget = wibox.container.margin
}

return hdd_meter
