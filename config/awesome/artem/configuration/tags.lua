local awful = require('awful')
local icons = require('themes.icons')
local l = awful.layout.suit  -- Just to save some typing: use an alias.

local tags = {
    {
        name = "Coding",
        icon = icons.code,
        layout = l.tile
    },
    {
        name = "Internet",
        icon = icons.chrome,
        layout = l.max
    },
    {
        name = "Gaming",
        icon = icons.controller,
        layout = l.max
    },
    {
        name = "Graphics",
        icon = icons.brush,
        layout = l.floating
    },
    {
        name = "Files",
        icon = icons.files,
        layout = l.floating
    },
    {
        name = "VMs",
        icon = icons.layers,
        layout = l.floating
    }
}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}


awful.screen.connect_for_each_screen(
  function(s)
for i, tag in pairs(tags) do
    awful.tag.add(
        tag.name,
        {
          icon = tag.icon,
          icon_only = true,
          layout = tag.layout,
          gap_single_client = false,
          gap = 4,
          screen = s,
        --   defaultApp = tag.defaultApp,
          selected = i == 1
        }
    )
end
  end
)

