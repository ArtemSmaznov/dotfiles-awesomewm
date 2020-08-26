local awful = require('awful')
local beautiful = require('beautiful')
local ruled = require("ruled")
local apps = require('configuration.apps')
local icons = require('theme.icons')

local default_layout = awful.layout.suit.spiral

local tags = {
	{
		name = 'terminal',
		icon = icons.tags.terminal,
		type = 'terminal',
		default_app = apps.default.terminal,
		layout = awful.layout.suit.tile.bottom,
		screen = 2,
		selected = true,
    apps = {
      class = { 
        "URxvt",
        "XTerm",
        "UXTerm",
        "kitty",
        "K3rmit",
        "Terminator",
        "whatsapp",
        "Slack",
        "obs",
      }
    }
	},
	{
		name = 'internet',
		icon = icons.tags.web_browser,
		type = 'chrome',
		default_app = apps.default.web_browser,
		layout = default_layout,
		screen = 1,
		selected = true,
    apps = {
      class = {
        "firefox",
        "Tor Browser",
        "discord",
        "Chromium",
        "Google-chrome"
      }
    } --- Add exceptions for file openers <<<<<<<<<<
	},
	{
		name = 'gaming',
		icon = icons.tags.controller,
		type = 'game',
		default_app = apps.default.game,
		layout = awful.layout.suit.floating,
		screen = 1,
    apps = {
      class = {
        "Wine",
        "dolphin-emu",
        "Lutris",
        "Citra",
        "SuperTuxKart",
        "steam_app",
      },
      name = {
        "Steam",
        "GOG Galaxy"
      },
    }
	},
	{
		name = 'coding',
		icon = icons.tags.text_editor,
		type = 'code',
		default_app = apps.default.ide,
		layout = awful.layout.suit.max,
		screen = 1,
    apps = {
      class = {
        "Geany",
        "Atom",
        "Subl3",
        "code-oss",
        "Cypress",
        "Oomox",
        "Unity",
        "UnityHub",
        "jetbrains-studio"
    },
      name  = {
        "LibreOffice",
        "libreoffice",
        "cypress"
      }
    }
	},
	{
		name = 'computer',
		icon = icons.tags.file_manager,
		type = 'files',
		default_app = apps.default.file_manager,
		layout = default_layout,
		screen = 1,
    apps = {
      class = {
        "dolphin",
        "ark",
        "Nemo",
        "File-roller",
        "googledocs",
        "keep",
        "calendar"
      }
    }
	},
	{
		name = 'multimedia',
		icon = icons.tags.multimedia,
		type = 'music',
		default_app = 'vlc',
		layout = default_layout,
		screen = 1,
    apps = {
      class = {
        "vlc",
        "Spotify",
        "Celluloid",
        "youtubemusic"
      },
      name = { "Google Play Music" }
    }
	},
	{
		name = 'graphics',
		icon = icons.tags.graphics,
		type = 'art',
		default_app = apps.default.graphics_editor,
		layout = default_layout,
    screen = 1,
    apps = {
      class = {
        "Gimp-2.10",
        "Inkscape",
        "Flowblade",
        "digikam",
      }
    }
	},
	{
		name = 'sandbox',
		icon = icons.tags.sandbox,
		type = 'virtualbox',
		default_app = apps.default.vm,
		layout = default_layout,
    screen = 1,
    apps = {
      class = {
        "VirtualBox Manage",
        "VirtualBox Machine"
      }
    }
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
    tag.name,     -- independant tags for each screen
    -- i,            -- screens have the same tags
    {
      icon = tag.icon,
      icon_only = true,
      layout = tag.layout,
      default_layout = tag.layout,
      gap_single_client = false,
      gap = beautiful.useless_gap,
      screen = tag.screen,
      default_app = tag.default_app,
      selected = tag.selected,      -- independant tags for each screen
      -- selected = i == 1,            -- screens have the same tags
    }
  )

  ruled.client.connect_signal(
    "request::rules",
    function()
      ruled.client.append_rule {
        rule_any = tag.apps,
        properties = { 
          tag = tag.name,
          -- screen = tag.screen, -- doesn't work for some reason
        }
      }
    end
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
