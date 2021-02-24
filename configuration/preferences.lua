local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

return {
  system = {
    icons_update_interval = 5,  -- in seconds
  },
  system_tray = {
    expanded = true,            -- true or false
    orientation = 'vertical'    -- 'vertical' or 'horizontal', will move the widget between the top and side bars
  },
  formatting = {
    time_short = '%l:%M %p',
    time_long = '%l:%M:%S %p',
    date_short = '%a, %d %b',
    date_long = '%a, %d %b %Y',
  },
  panels = {
    size_top = dpi(40),
    size_side = dpi(45),
  },
  theme = {
    theme = 'sakura',
    -- wallpaper = '/usr/share/backgrounds/linuxmint-ulyssa/rranwa_india.jpg',
  }
}
