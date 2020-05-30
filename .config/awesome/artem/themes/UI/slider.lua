local gears = require("gears")
local wibox = require("wibox")

function build()
	return wibox.widget{
		max_value			= 100,
		forced_height		= 15,
		forced_width		= 250,
		paddings			= 3,
		color				= '#CCC',
		background_color	= "#444",
		read_only = false,
		shape				= gears.shape.rounded_bar,
		bar_shape			= gears.shape.rounded_bar,
		widget				= wibox.widget.progressbar,
	}
  end

  return build
