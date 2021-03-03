local user_preferences = require('configuration.preferences')
local material = require('theme.colors.material')

local theme = {}

local default_font = 'SF Pro Text Regular 10'
local default_font_bold = 'SF Pro Text Bold 10'
local default_icon_theme ='Papirus-Dark'
local default_wallpaper = '/usr/share/backgrounds/linuxmint-ulyssa/rbooth_floral.jpg'

theme.font = user_preferences.theme.font or default_font
theme.font_bold = user_preferences.theme.font_bold or default_font_bold
theme.icon_theme = user_preferences.theme.icons or default_icon_theme
theme.wallpaper = user_preferences.theme.wallpaper or default_wallpaper

theme.toggle = material.pink.hue_400

local awesome_overrides = function(theme)

end

return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
