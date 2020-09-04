local wibox = require('wibox')

local dpi = require('beautiful').xresources.apply_dpi

local separator =  wibox.widget {
	orientation = 'horizontal',
	forced_height = dpi(1),
	span_ratio = 0.55,
	widget = wibox.widget.separator
}

return wibox.widget {
	layout = wibox.layout.align.vertical,
  	{
		require("widgets.panel-widgets.xdg-folders.home"),
		-- require("widgets.panel-widgets.xdg-folders.documents"),
		require("widgets.panel-widgets.xdg-folders.downloads"),
		require("widgets.panel-widgets.xdg-folders.pictures"),
		require("widgets.panel-widgets.xdg-folders.videos"),
		separator,
		require("widgets.panel-widgets.xdg-folders.trash"),
		layout = wibox.layout.fixed.vertical,
  	},
}
