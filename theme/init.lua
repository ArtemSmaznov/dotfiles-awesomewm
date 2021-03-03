local gtable = require('gears.table')
local default_theme = require('theme.default')
local user_preferences = require('configuration.preferences')

local theme = require('theme.' .. user_preferences.theme.theme)

local final_theme = {}
gtable.crush(final_theme, default_theme.theme)
gtable.crush(final_theme, theme.theme)
default_theme.awesome_overrides(final_theme)
theme.awesome_overrides(final_theme)

return final_theme
