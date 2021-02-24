local gears = require('gears')
local beautiful = require('beautiful')

local filesystem = require('gears.filesystem')
local dpi = require('beautiful').xresources.apply_dpi

local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local system_dir = '/usr/share/awesome/themes/default/layouts/'

local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. '/'
local tip = titlebar_icon_path

local user_preferences = require('configuration.preferences')

local theme = {}

-- Defaults
theme.font = user_preferences.theme.font or 'SF Pro Text Regular 10'
theme.font_bold = user_preferences.theme.font_bold or 'SF Pro Text Bold 10'
theme.icon_theme = user_preferences.theme.icons or 'Papirus-Dark'
theme.wallpaper = user_preferences.theme.wallpaper or '/usr/share/backgrounds/linuxmint-ulyssa/rbooth_floral.jpg'

-- Colorscheme
theme.system_black_dark = '#3D4C5F'
theme.system_black_light = '#56687E'

theme.system_red_dark = '#EE4F84'
theme.system_red_light = '#F48FB1'

theme.system_green_dark = '#53E2AE'
theme.system_green_light = '#A1EFD3'

theme.system_yellow_dark = '#F1FF52'
theme.system_yellow_light = '#F1FA8C'

theme.system_blue_dark = '#6498EF' 
theme.system_blue_light = '#92B6F4'

theme.system_magenta_dark = '#985EFF'
theme.system_magenta_light = '#BD99FF'

theme.system_cyan_dark = '#24D1E7'
theme.system_cyan_light = '#87DFEB'

theme.system_white_dark = '#E5E5E5'
theme.system_white_light = '#F8F8F2'


-- Accent color
theme.accent = theme.system_white_dark

-- Background color
theme.background = '#000000' .. '66'

-- Transparent
theme.transparent = '#00000000'

-- Awesome icon
theme.awesome_icon = theme_dir .. '/icons/awesome.svg'

local awesome_overrides = function(theme)

end

return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
