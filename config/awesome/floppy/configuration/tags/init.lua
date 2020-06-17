local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local apps = require('configuration.apps')

local icons = require('theme.icons')

local tags = {
	{
		icon = icons.tags.web_browser,
		type = 'chrome',
		default_app = apps.default.web_browser,
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		icon = icons.tags.controller,
		type = 'game',
		default_app = apps.default.game,
		layout = awful.layout.suit.floating,
		screen = 1
	},
	{
		icon = icons.tags.text_editor,
		type = 'code',
		default_app = apps.default.ide,
		layout = awful.layout.suit.max,
		screen = 1
	},
	{
		icon = icons.tags.file_manager,
		type = 'files',
		default_app = apps.default.file_manager,
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		icon = icons.tags.multimedia,
		type = 'music',
		default_app = 'vlc',
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		icon = icons.tags.graphics,
		type = 'art',
		default_app = apps.default.graphics_editor,
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		icon = icons.tags.sandbox,
		type = 'virtualbox',
		default_app = apps.default.vm,
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		icon = icons.tags.terminal,
		type = 'terminal',
		default_app = apps.default.terminal,
		layout = awful.layout.suit.max,
		screen = 2
	},
}


tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
		awful.layout.suit.tile,
		awful.layout.suit.max,
		-- awful.layout.suit.spiral.dwindle,
		awful.layout.suit.tile.bottom
    })
end)


screen.connect_signal("request::desktop_decoration", function(s)
	for i, tag in pairs(tags) do	
	awful.tag.add(
			i,
			{
				icon = tag.icon,
				icon_only = true,
				layout = tag.layout,
				gap_single_client = false,
				gap = beautiful.useless_gap,
				screen = s,
				default_app = tag.default_app,
				selected = i == 1
			}
		)
	end
end)


tag.connect_signal(
	'property::layout',
	function(t)
		local currentLayout = awful.tag.getproperty(t, 'layout')
		if (currentLayout == awful.layout.suit.max) then
			t.gap = 0
		else
			t.gap = beautiful.useless_gap
		end
	end
)
