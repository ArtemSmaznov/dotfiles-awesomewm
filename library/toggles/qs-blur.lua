require('modules.blur')
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')

local icons = require('theme.icons')

local icon = wibox.widget{
	image = icons.symbolic.blur_on,
	resize = true,
	widget = wibox.widget.imagebox
}

local quick_setting = require('library.ui.quick-settings-toggle')(icon)
require('library.ui.tooltip')(quick_setting, 'Blur')

local function set_toggle_state (state)
  if state then
    quick_setting.bg = beautiful.toggle
  else
    quick_setting.bg = beautiful.transparent
  end
  quick_setting.activated = state
end

awesome.connect_signal(
  'module::blur:enable',
  function()
    set_toggle_state(true)
  end
)

awesome.connect_signal(
  'module::blur:disable',
  function()
    set_toggle_state(false)
  end
)

awesome.connect_signal(
  'toggle::blur:update',
  function (state)
    set_toggle_state(state)
  end
)

function quick_setting:toggle ()
  if not quick_setting.activated then
    awesome.emit_signal('module::blur:enable')
  else
    awesome.emit_signal('module::blur:disable')
  end
end

quick_setting:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        quick_setting:toggle()
      end
    ),
    awful.button(
      {},
      3,
      nil,
      function()
        awesome.emit_signal('widget::blur:slider:toggle')
      end
    )
  )
)

return quick_setting
