require('modules.wifi')
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')

local icon      = require('library.dynamic-icons.wifi')
local tooltip   = require('library.ui.tooltip')
local qs_toggle = require('library.ui.quick-settings-toggle')

local widget = wibox.widget {
		id = 'icon',
		widget = wibox.widget.imagebox,
		resize = true
}

local widget_button = qs_toggle(icon)
tooltip(widget_button, 'Wifi')

function widget:update_toggle(module_is_on)
  if module_is_on then
    widget_button.bg = beautiful.system_black_light
  else
    widget_button.bg = beautiful.transparent
  end
  widget.on = module_is_on
end

function widget:turn_on()
  self.on = true
  widget:update_toggle(true)
  awesome.emit_signal('module::wifi:enable')
end

function widget:turn_off()
  self.on = false
  widget:update_toggle(false)
  awesome.emit_signal('module::wifi:disable')
end

function widget:toggle()
  if not self.on then
    widget:turn_on()
  else
    widget:turn_off()
  end
end

widget:update_toggle(widget.on)

widget_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        widget:toggle()
      end
    )
  )
)

awesome.connect_signal(
	'module::wifi:status:reply',
  function(state)
    widget:update_toggle(state)
  end
)

awesome.connect_signal(
	'modules:update',
  function()
    awesome.emit_signal('module::wifi:status:request')
  end
)

return widget_button