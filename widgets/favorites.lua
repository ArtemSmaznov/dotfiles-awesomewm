local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local menubar = require("menubar")

local dpi = beautiful.xresources.apply_dpi

local favorites = require('configuration.apps').favorites
local clickable_container = require('widgets.system-elements.clickable-container.with-background')
local box_with_header = require('widgets.system-elements.box-with-header')
local tooltip = require('widgets.system-elements.tooltip')

local build = wibox.layout.fixed.vertical()
build.spacing = dpi(7)

for _, favs in pairs(favorites) do
  local apps_list = wibox.layout.grid.vertical()
  apps_list.forced_num_cols = 5
  
  local box_constructor = wibox.layout.fixed.vertical()

  box_constructor:add(box_with_header('header', favs.category))
  
  for _, app in pairs(favs.apps) do
    local app_instance = wibox.widget {
      {
        { 
          image = menubar.utils.lookup_icon(app.icon),
          resize = true,
          forced_width = dpi(50),
          forced_height = dpi(50),
          widget = wibox.widget.imagebox
        },
        widget = clickable_container
      },
      margins = dpi(6),
      widget = wibox.container.margin
    }

    tooltip(app_instance, app.command)

    app_instance:buttons(
      gears.table.join(
        awful.button(
          {},
          1,
          nil,
          function()
            local focused = awful.screen.focused()

            if focused.left_panel and focused.left_panel.opened then
              focused.left_panel:toggle()
            end

            awful.spawn(app.command)
          end
        )
      )
    )
    
    apps_list:add(app_instance)
  end

  local box_instance = box_with_header('body', apps_list)
  box_constructor:add(box_instance)
  build:add(box_constructor)
end

return build

