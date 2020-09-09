local awful = require('awful')
local apps = require('configuration.apps')

local bin_dir = '${HOME}/.local/bin/'

return {
  shutdown = function()
    awful.spawn.with_shell('poweroff')
  end,

  reboot = function()
    awful.spawn.with_shell('reboot')
  end,

  suspend = function()
    awful.spawn.with_shell(apps.default.lock .. ' & systemctl suspend')
  end,

  logout = function()
    awesome.quit()
  end,

  lock = function()
    awful.spawn.with_shell('sleep 1 && ' .. apps.default.lock)
  end,

  reboot_to_windows = function()
    awful.spawn.with_shell('sudo ' .. bin_dir .. 'winreboot')
  end,
}