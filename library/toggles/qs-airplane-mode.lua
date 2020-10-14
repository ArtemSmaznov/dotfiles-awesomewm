require('modules.airplane-mode')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')

local icon = require('library.dynamic-icons.airplane-mode')
local quick_setting = require('library.ui.quick-settings-toggle')(icon)
require('library.ui.tooltip')(quick_setting, 'Airplane Mode')

local function set_toggle_state (state)
  if state then
    quick_setting.bg = beautiful.system_black_light
  else
    quick_setting.bg = beautiful.transparent
  end
  quick_setting.activated = state
end

awesome.connect_signal(
  'module::airplane_mode:enable',
  function()
    set_toggle_state(true)
  end
)

awesome.connect_signal(
  'module::airplane_mode:disable',
  function()
    set_toggle_state(false)
  end
)

awesome.connect_signal(
  'toggle::airplane_mode:update',
  function (state)
    set_toggle_state(state)
  end
)

function quick_setting:toggle ()
  if not quick_setting.activated then
    awesome.emit_signal('module::airplane_mode:enable')
  else
    awesome.emit_signal('module::airplane_mode:disable')
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