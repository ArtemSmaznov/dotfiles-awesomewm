-------------------------------------------------
-- Package Updater Widget for Awesome Window Manager
-- Shows the package updates information in Arch Linux
-- Will only show if there is/are updates available
-------------------------------------------------

local awful = require('awful')
local naughty = require('naughty')
local wibox = require('wibox')
local gears = require('gears')

local watch = awful.widget.watch

local apps = require('configuration.apps')

local clickable_container = require('library.ui.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local update_available = false
local number_of_updates_available = nil
local update_package = nil

local return_button = function()

  local widget = wibox.widget {
    {
      id = 'icon',
      widget = wibox.widget.imagebox,
      image = icons.symbolic.updates.uptodate,
      resize = true
    },
    layout = wibox.layout.align.horizontal
  }

  local widget_button = wibox.widget {
    {
      widget,
      margins = dpi(7),
      widget = wibox.container.margin
    },
    widget = clickable_container
  }

  widget_button:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()

          if update_available then
            awful.spawn(apps.default.package_manager .. ' --updates', false)

          else
            awful.spawn(apps.default.package_manager, false)

          end
        end
      )
    )
  )


  -- Tooltip
  awful.tooltip(
    {
      objects = {widget_button},
      mode = 'outside',
      align = 'right',
      margin_leftright = dpi(8),
      margin_topbottom = dpi(8),
      timer_function = function()

        if update_available then
          return update_package:gsub('\n$', '')
        else
          return 'We are up-to-date!'
        end

      end,
      preferred_positions = {'right', 'left', 'top', 'bottom'}
    }
  )


  watch('pamac checkupdates', 60, function(_, stdout)

    number_of_updates_available = tonumber(stdout:match('.-\n'):match('%d*'))
    update_package = stdout

    local icon_name

    if number_of_updates_available ~= nil then
      update_available = true
      if stdout:match('linux')
      or stdout:match('ucode')
      or stdout:match('nvidia')
      or stdout:match('xf86-video')
      then
        icon_name = 'urgent'
      else
        icon_name = 'available'
      end

    else
      update_available = false
      icon_name = 'uptodate'

    end

    widget.icon:set_image(icons.symbolic.updates[icon_name])

    collectgarbage('collect')


  end)

  return widget_button

end

return return_button