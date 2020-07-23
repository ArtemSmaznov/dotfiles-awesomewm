local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container.with-background')

local menu_items = {}

local default_layout = awful.layout.suit.tile

-- local default_layouts = awful.layout.layouts
local my_layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.max,
  -- awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.corner.nw,
  awful.layout.suit.corner.ne,
  awful.layout.suit.corner.sw,
  awful.layout.suit.corner.se,
  awful.layout.suit.floating,
}

function Build(s)
  local layoutbox = wibox.widget {
    {
      awful.widget.layoutbox(s),
      margins = dpi(7),
      widget = wibox.container.margin
    },
    widget = clickable_container
  }


  
  for _, layout in ipairs(my_layouts) do
    local layout_name = awful.layout.getname(layout)
    table.insert(
      menu_items, 
      {
        layout_name,
        function()
          awful.layout.set(layout)
        end,
        beautiful['layout_' .. layout_name]
      }
    )
  end

  local layouts_menu = awful.menu(
    { 
      items = menu_items
    }
  )

  layoutbox:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          layouts_menu:toggle()
        end
      ),
      awful.button(
        {},
        3, -- Reset to Tag's default layout on right click
        function()
          awful.layout.set(awful.screen.focused().selected_tag.default_layout)
        end
      ),
      awful.button(
        {},
        4,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        5,
        function()
          awful.layout.inc(-1)
        end
      )
    )
  )
    
  return layoutbox
end

return Build