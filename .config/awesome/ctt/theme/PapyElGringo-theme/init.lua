local filesystem = require('gears.filesystem')
local mat_colors = require('theme.mat-colors')
local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local dpi = require('beautiful').xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. '/icons/'
theme.font = 'Roboto medium 10'

-- Colors Pallets

-- Primary
theme.primary = mat_colors.brown
theme.primary.hue_500 = '#BE7656'
-- Accent
theme.accent = mat_colors.orange

-- Background
theme.background = mat_colors.brown

theme.background.hue_800 = '#1f1309'
theme.background.hue_900 = '#0E0504'

local awesome_overrides = function(theme)
  --
end
return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
