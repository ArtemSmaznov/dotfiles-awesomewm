require('modules.wifi')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local apps = require('configuration.apps')

local icon      = require('library.dynamic-icons.wifi')
local quick_setting = require('library.ui.quick-settings-toggle')(icon)
require('library.ui.tooltip')(quick_setting, 'Wifi')

local function set_toggle_state (state)
  if state then
    quick_setting.bg = beautiful.system_black_light
  else
    quick_setting.bg = beautiful.transparent
  end
  quick_setting.activated = state
end

awesome.connect_signal(
  'module::wifi:enable',
  function()
    set_toggle_state(true)
  end
)

awesome.connect_signal(
  'module::wifi:disable',
  function()
    set_toggle_state(false)
  end
)

awesome.connect_signal(
  'toggle::wifi:update',
  function (state)
    if state then
      set_toggle_state(true)
    else
      set_toggle_state(false)
    end
  end
)

function quick_setting:toggle ()
  if not quick_setting.activated then
    awesome.emit_signal('module::wifi:enable')
  else
    awesome.emit_signal('module::wifi:disable')
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
    )
  )
)

return quick_setting