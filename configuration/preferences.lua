local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

return {
  system = {
    icons_update_interval = 5,      -- in seconds
  },
  system_tray = {
    expanded = true,                -- true or false
    orientation = 'vertical'        -- 'vertical' or 'horizontal'
  },
  formatting = {
    time_short = '%l:%M %p',
    time_long = '',
    date_short = '%a, %d %b',
    date_long = '%a, %d %b %Y',
  },
}