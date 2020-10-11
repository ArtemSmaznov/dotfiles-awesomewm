local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local naughty = require('naughty')
local beautiful = require('beautiful')

local clickable_container = require('library.ui.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')

local sampleText = "Hello World!"
local screen = 'primary'

-- local new_shape = gears.shape.rounded_bar(cr, 70, 70)

local my_box = awful.popup {
  widget = {
    {
      bg = beautiful.fg_normal,
      forced_width = dpi(120),
      forced_height = dpi(5),
      shape = gears.shape.rounded_bar,
      widget = wibox.container.background
    },
    margins = dpi(5),
    widget = wibox.container.margin
  },
  ontop = true,
  height = dpi(300),
  bg = beautiful.transparent,
  screen = 1,
  visible = false,
  -- type = 'utility',
  cursor = 'hand1',
  placement = awful.placement.centered
}

local monitor = require('modules.monitor')

awesome.connect_signal(
  'debug',
  function ()
    local focused = awful.screen.focused()
    local clients = #focused.clients
    local tiledclients = #focused.tiled_clients

    local subresult = monitor.screenOrientation(2)
    local result = tostring(subresult)
    require('naughty').notify { text = result }
  end
)