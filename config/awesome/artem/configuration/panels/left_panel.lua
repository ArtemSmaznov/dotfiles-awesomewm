local awful = require('awful')
local wibox = require("wibox")
local workspace_switcher = require('widgets.workspace_switcher')


local LeftPanel = function(s, size, offsetcondition)
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
				width = size,
				height = s.geometry.height - offset,
				x = s.geometry.x,
				y = s.geometry.y + offset,
				visible = true
			}
		)

	panel:struts(
		{
			left = size,
		}
	)

	panel:setup {
		layout = wibox.layout.align.vertical,
		{
			layout = wibox.layout.fixed.vertical,
			require('widgets.start'),
			workspace_switcher(s)

		},
		nil,
		nil
		
	}
  
	return panel
  end
  
  return LeftPanel
  