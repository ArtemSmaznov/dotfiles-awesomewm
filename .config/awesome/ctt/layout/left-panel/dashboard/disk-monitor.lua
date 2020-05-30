local wibox = require('wibox')
local mat_list_item = require('widget.material.list-item')

return wibox.widget {
  wibox.widget {
    wibox.widget {
      text = 'Disk monitor',
      font = 'Roboto medium 12',
      widget = wibox.widget.textbox
    },
    widget = mat_list_item
  },
  require('widget.harddrive.homedrive-meter'),
  require('widget.harddrive.windrive-meter'),
  require('widget.harddrive.rootdrive-meter'),
  layout = wibox.layout.fixed.vertical
}
