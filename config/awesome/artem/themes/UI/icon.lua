local wibox = require('wibox')

function build(icon, size)
  return wibox.widget{
	image = icon,
	forced_height = size,
	forced_width = size,
	widget = wibox.widget.imagebox
}
end

return build
