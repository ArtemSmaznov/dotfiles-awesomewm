local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')

local clickable_container = require('library.ui.clickable-container.with-background')
local dpi = require('beautiful').xresources.apply_dpi

local sounds = require('theme.sounds')

local trash_widget = wibox.widget {
  {
    id = 'trash_icon',
    image = icons.places.trash,
    resize = true,
    widget = wibox.widget.imagebox
  },
  layout = wibox.layout.align.horizontal
}

local trash_menu = awful.menu({
  items = {
    {
      "Open trash",
      function()
        awful.spawn.easy_async_with_shell("gio open trash:///", function(stdout) end, 1)
      end,
      icons.places.open_folder
    },
    {
      "Delete forever", 
      {
        {
          'Yes',
          function()
            awful.spawn.easy_async_with_shell("gio trash --empty", function(stdout) end, 1)
            awful.spawn('paplay ' .. sounds.trash, false)
          end,
          icons.ui.yes
        },
        {
          'No',
          '',
          icons.ui.no
        }
      },
      icons.places.trash
    },
 
 }
})


local trash_button = wibox.widget {
  {
    trash_widget,
    margins = dpi(10),
    widget = wibox.container.margin
  },
  widget = clickable_container
}

-- Tooltip for trash_button
trash_tooltip = awful.tooltip {
  objects = {trash_button},
  mode = 'outside',
  align = 'right',
  markup = 'Trash',
  margin_leftright = dpi(8),
  margin_topbottom = dpi(8),
  preferred_positions = {'right', 'left', 'top', 'bottom'}
}

-- Mouse event for trash_button
trash_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn({'gio', 'open', 'trash:///'}, false)
      end
    ),
    awful.button(
      {},
      3,
      nil,
      function()
        trash_menu:toggle() 
        trash_tooltip.visible = not trash_tooltip.visible
      end
    )
  )
)



-- Update icon on changes
local check_trash_list = function()
  awful.spawn.easy_async_with_shell('gio list trash:/// | wc -l', function(stdout) 
    if tonumber(stdout) > 0 then
      trash_widget.trash_icon:set_image(icons.places.trash_full)

      awful.spawn.easy_async_with_shell('gio list trash:///', function(stdout) 

        trash_tooltip.markup = '<b>Trash contains:</b>\n' .. stdout:gsub('\n$', '')

      end, false)


    else
      trash_widget.trash_icon:set_image(icons.places.trash)

      trash_tooltip.markup = 'Trash empty'

    end
  end, false)
end


-- Check trash on awesome (re)-start
check_trash_list()


-- Kill the old process of gio monitor trash:///
awful.spawn.easy_async_with_shell('ps x | grep \'gio monitor trash:///\' | grep -v grep | awk \'{print  $1}\' | xargs kill', function() 

  awful.spawn.with_line_callback('gio monitor trash:///', {
    stdout = function(_)
      check_trash_list()
    end
  })

end, false)


return trash_button
