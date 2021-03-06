local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local user = require('configuration.preferences')
local material = require('theme.colors.material')

local theme = {}

--------------------------------------------------------
-- Theme defaults
--------------------------------------------------------
local font         = user.theme.font or 'SF Pro Text'
local font_regular = font .. ' Regular 10'
local font_bold    = font .. ' Bold 10'
local font_title   = font .. ' Bold 14'
local icons        = 'Papirus-Dark'
local wallpaper    = '/usr/share/backgrounds/linuxmint-ulyssa/rbooth_floral.jpg'


--------------------------------------------------------
-- Setting the defaults
--------------------------------------------------------
theme.font       = font_regular
theme.font_bold  = font_bold
theme.title_font = font_title
theme.icon_theme = user.theme.icons      or icons
theme.wallpaper  = user.theme.wallpaper  or wallpaper


--------------------------------------------------------
-- Color scheme
--------------------------------------------------------
theme.toggle = material.pink.hue_700
theme.system_elements = material.pink.hue_100

theme.bg_focus = material.pink.hue_700
theme.bg_urgent = material.red.hue_800


--------------------------------------------------------
-- UI
--------------------------------------------------------







return {
  theme = theme,
}
