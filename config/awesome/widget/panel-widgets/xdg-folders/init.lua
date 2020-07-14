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
		require("widget.panel-widgets.xdg-folders.home"),
		-- require("widget.panel-widgets.xdg-folders.documents"),
		require("widget.panel-widgets.xdg-folders.downloads"),
		require("widget.panel-widgets.xdg-folders.pictures"),
		require("widget.panel-widgets.xdg-folders.videos"),
		separator,
		require("widget.panel-widgets.xdg-folders.trash"),
		layout = wibox.layout.fixed.vertical,
  	},
}
