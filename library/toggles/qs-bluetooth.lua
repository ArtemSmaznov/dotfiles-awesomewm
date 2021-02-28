require('modules.bluetooth')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local apps = require('configuration.apps')

local icon = require('library.dynamic-icons.bluetooth')
local quick_setting = require('library.ui.quick-settings-toggle')(icon)
require('library.ui.tooltip')(quick_setting, 'Bluetooth')

local function set_toggle_state (state)
  if state then
    quick_setting.bg = beautiful.toggle
  else
    quick_setting.bg = beautiful.transparent
  end
  quick_setting.activated = state
end

awesome.connect_signal(
  'module::bluetooth:enable',
  function()
    set_toggle_state(true)
  end
)

awesome.connect_signal(
  'module::bluetooth:disable',
  function()
    set_toggle_state(false)
  end
)

awesome.connect_signal(
  'toggle::bluetooth:update',
  function (state)
    set_toggle_state(state)
  end
)

function quick_setting:toggle ()
  if not quick_setting.activated then
    awesome.emit_signal('module::bluetooth:enable')
  else
    awesome.emit_signal('module::bluetooth:disable')
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
        awful.spawn(apps.default.bluetooth_manager, false)
      end
    )
  )
)

return quick_setting
