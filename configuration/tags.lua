local awful = require('awful')
local beautiful = require('beautiful')
local apps = require('configuration.apps')
local icons = require('theme.icons')
local monitor = require('modules.monitor')

local tags = {
	{
		name = 'terminal',
		icon = icons.tags.terminal,
		default_app = apps.default.terminal,
    layout = awful.layout.suit.tile,
		screen = 2,
    selected = true,
	},
	{
		name = 'internet',
		icon = icons.tags.web_browser,
		default_app = apps.default.web_browser,
		selected = true,
	},
	{
		name = 'gaming',
		icon = icons.tags.controller,
		default_app = apps.default.game,
		layout = awful.layout.suit.floating,
	},
	{
		name = 'coding',
		icon = icons.tags.text_editor,
		default_app = apps.default.ide,
    layout = awful.layout.suit.max,
	},
	{
		name = 'computer',
		icon = icons.tags.file_manager,
		default_app = apps.default.file_manager,
	},
	{
		name = 'multimedia',
		icon = icons.tags.multimedia,
		default_app = 'vlc',
	},
	{
		name = 'graphics',
		icon = icons.tags.graphics,
		default_app = apps.default.graphics_editor,
	},
	{
		name = 'sandbox',
		icon = icons.tags.sandbox,
		default_app = apps.default.vm,
	},
}

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
			awful.layout.suit.tile,
			awful.layout.suit.max,
			awful.layout.suit.tile.bottom
    })
end)

-- Tag Creation
for i, tag in pairs(tags) do
  awful.tag.add(
    tag.name,
    {
      icon                = tag.icon,
      default_app         = tag.default_app,
      icon_only           = tag.icon_only or true,
      layout              = tag.layout or awful.layout.suit.spiral,
      default_layout      = tag.layout or awful.layout.suit.spiral,
      gap                 = tag.gap or beautiful.useless_gap,
      gap_single_client   = tag.single_client_gap or false,
      master_count        = monitor.orientation(tag.screen) == 'portrait' and 0 or nil,
      selected            = tag.screen ~= nil and tag.screen <= screen:instances() and tag.selected or false,
      screen              = tag.screen ~= nil and tag.screen <= screen:instances() and tag.screen or 'primary',
    }
  )
end

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
