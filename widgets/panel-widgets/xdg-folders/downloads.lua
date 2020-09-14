local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')

local clickable_container = require('widgets.system-elements.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi


local dl_widget = wibox.widget {
  {
    image = icons.places.downloads_folder,
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local downloads_button = wibox.widget {
  {
    dl_widget,
    margins = dpi(5),
    widget = wibox.container.margin
  },
  widget = clickable_container
}

downloads_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn.with_shell('xdg-open $(xdg-user-dir DOWNLOAD)')
      end
    )
  )
)

awful.tooltip(
  {
    objects = {downloads_button},
    mode = 'outside',
    align = 'right',
    text = 'Downloads',
    margin_leftright = dpi(8),
    margin_topbottom = dpi(8),
    preferred_positions = {'right', 'left', 'top', 'bottom'}
  }
)


return downloads_button
