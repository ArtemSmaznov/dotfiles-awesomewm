local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('library.ui.clickable-container.no-background')
local user_preferences = require('configuration.preferences')
local icons = require('theme.icons')

local build = function(s)

  local blur_slider_visible = false
  local user_profile_visible = false
  local panel_visible = false

  -- ░█▀▀░▀█▀░█▀█░▀█▀░█░█░█▀▀
  -- ░▀▀█░░█░░█▀█░░█░░█░█░▀▀█
  -- ░▀▀▀░░▀░░▀░▀░░▀░░▀▀▀░▀▀▀

  local profile_icon = wibox.widget {
    {
      {
        image = icons.face,
        widget = wibox.widget.imagebox
      },
      widget = clickable_container
    },
    shape = gears.shape.circle,
    widget = wibox.container.background
  }

  local date = wibox.widget {
    format = '<span font="SF Pro Text Bold 11">'
    .. user_preferences.formatting.date_long
    ..'</span>',
    widget = wibox.widget.textclock
  }

  local time = wibox.widget {
    format = '<span font="SF Pro Text Bold 11">'
    .. user_preferences.formatting.time_short
    ..'</span>',
    widget = wibox.widget.textclock
  }

  s.status = wibox.widget {
    {
      date,
      nil,
      {
        time,
        profile_icon,
        spacing = dpi(8),
        layout = wibox.layout.fixed.horizontal
      },
      layout = wibox.layout.align.horizontal
    },
    left = dpi(12),
    right = dpi(12),
    forced_height = dpi(32),
    widget = wibox.container.margin
  }

  profile_icon:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          awesome.emit_signal('widget::user_profile:toggle')
        end
      )
    )
  )

  -- ░█░█░█▀█░█░░░█░█░█▄█░█▀▀░░░█▀▀░█░░░▀█▀░█▀▄░█▀▀░█▀▄
  -- ░▀▄▀░█░█░█░░░█░█░█░█░█▀▀░░░▀▀█░█░░░░█░░█░█░█▀▀░█▀▄
  -- ░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀

  s.volume_slider = wibox.widget {
    {
      {
        id = 'icon',
        require('library.dynamic-icons.volume'),
        top = dpi(10),
        bottom = dpi(10),
        widget = wibox.container.margin
      },
      id = 'body',
      require('library.sliders.volume'),
      spacing = dpi(24),
      layout = wibox.layout.fixed.horizontal
    },
    left = dpi(24),
    right = dpi(24),
    forced_height = dpi(48),
    widget = wibox.container.margin
  }

  s.volume_slider.body.icon:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          awesome.emit_signal('widget::volume:mute', nil)
        end
      )
    )
  )

  -- ░█▀▄░█▀▄░▀█▀░█▀▀░█░█░▀█▀░█▀█░█▀▀░█▀▀░█▀▀░░░█▀▀░█░░░▀█▀░█▀▄░█▀▀░█▀▄
  -- ░█▀▄░█▀▄░░█░░█░█░█▀█░░█░░█░█░█▀▀░▀▀█░▀▀█░░░▀▀█░█░░░░█░░█░█░█▀▀░█▀▄
  -- ░▀▀░░▀░▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀

  s.brightness_slider = wibox.widget {
    {
      {
        {
          image = icons.symbolic.brightness.high,
          resize = true,
          widget = wibox.widget.imagebox
        },
        top = dpi(10),
        bottom = dpi(10),
        widget = wibox.container.margin
      },
      require('library.sliders.brightness'),
      spacing = dpi(24),
      layout = wibox.layout.fixed.horizontal
    },
    left = dpi(24),
    right = dpi(24),
    forced_height = dpi(48),
    widget = wibox.container.margin
  }

  -- ░█░█░█▀█░█░░░█░█░█▄█░█▀▀░░░█▀▀░█░░░▀█▀░█▀▄░█▀▀░█▀▄
  -- ░▀▄▀░█░█░█░░░█░█░█░█░█▀▀░░░▀▀█░█░░░░█░░█░█░█▀▀░█▀▄
  -- ░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀

  s.volume_slider = wibox.widget {
    {
      {
        id = 'icon',
        require('library.dynamic-icons.volume'),
        top = dpi(10),
        bottom = dpi(10),
        widget = wibox.container.margin
      },
      id = 'body',
      require('library.sliders.volume'),
      spacing = dpi(24),
      layout = wibox.layout.fixed.horizontal
    },
    left = dpi(24),
    right = dpi(24),
    forced_height = dpi(48),
    widget = wibox.container.margin
  }

  s.volume_slider.body.icon:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          awesome.emit_signal('widget::volume:mute', nil)
        end
      )
    )
  )

  -- ░█▀▄░█░░░█░█░█▀▄░░░█▀▀░█░░░▀█▀░█▀▄░█▀▀░█▀▄
  -- ░█▀▄░█░░░█░█░█▀▄░░░▀▀█░█░░░░█░░█░█░█▀▀░█▀▄
  -- ░▀▀░░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀

  s.blur_slider = wibox.widget {
    {
      {
        {
          image = icons.symbolic.blur_on,
          resize = true,
          widget = wibox.widget.imagebox
        },
        top = dpi(10),
        bottom = dpi(10),
        widget = wibox.container.margin
      },
      require('library.sliders.blur'),
      spacing = dpi(24),
      layout = wibox.layout.fixed.horizontal
    },
    left = dpi(24),
    right = dpi(24),
    forced_height = dpi(48),
    widget = wibox.container.margin
  }

  s.blur_slider.visible = blur_slider_visible

  awesome.connect_signal(
    'widget::blur:slider:toggle',
    function()
      if not blur_slider_visible then
        blur_slider_visible = true
        s.blur_slider.visible = blur_slider_visible
      else
        blur_slider_visible = false
        s.blur_slider.visible = blur_slider_visible
      end
    end
  )

  -- ░█▀█░█▀▄░█▀█░█▀▀░▀█▀░█░░░█▀▀
  -- ░█▀▀░█▀▄░█░█░█▀▀░░█░░█░░░█▀▀
  -- ░▀░░░▀░▀░▀▀▀░▀░░░▀▀▀░▀▀▀░▀▀▀

  s.user_profile = require('widgets.user-profile')

  s.user_profile.visible = user_profile_visible

  awesome.connect_signal(
    'widget::user_profile:toggle',
    function()
      if not user_profile_visible then
        user_profile_visible = true
        s.user_profile.visible = user_profile_visible
      else
        user_profile_visible = false
        s.user_profile.visible = user_profile_visible
      end
    end
  )

  -- ░█▀█░█▀█░█▀█░█▀▀░█░░░█▀▀
  -- ░█▀▀░█▀█░█░█░█▀▀░█░░░▀▀█
  -- ░▀░░░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

  local first_column = wibox.widget {
    s.status,
    s.user_profile,
    s.brightness_slider,
    require('widgets.quick-settings'),
    s.volume_slider,
    s.blur_slider,
    require('widgets.weather'),
    require('widgets.notif-center')(s),
    spacing = dpi(7),
    forced_width = dpi(500),
    layout = wibox.layout.fixed.vertical
  }

  local second_column = wibox.widget {
    require('widgets.hardware-monitor'),
    require('widgets.disk-usage'),
    -- require('widgets.social-media'),
    -- require('widgets.calculator'),
    spacing = dpi(7),
    forced_width = dpi(300),
    layout = wibox.layout.fixed.vertical
  }

  local notif_tray = awful.popup {
    widget = {
      {
        {
          first_column,
          second_column,
          spacing = dpi(7),
          layout = wibox.layout.fixed.horizontal
        },
        margins = dpi(16),
		    widget = wibox.container.margin
      },
			bg = beautiful.background,
      widget = wibox.container.background()
    },
    ontop = true,
    type = 'toolbar',
    maximum_height = s.geometry.height,
    maximum_width = s.geometry.width/2,
    bg = beautiful.transparent,
    screen = s,
    visible = false,
    placement = awful.placement.top
     + awful.placement.no_offscreen,
  }

  s.backdrop_notif = wibox
	{
		ontop = true,
		screen = s,
		bg = beautiful.transparent,
    type = 'utility',
		x = s.geometry.x,
		y = s.geometry.y,
		width = s.geometry.width,
		height = s.geometry.height
	}

  function notif_tray:open()
		local focused = awful.screen.focused()
    focused.backdrop_notif.visible = true
    focused.notif_tray.visible = true
    awesome.emit_signal('notification_tray:opened')
	end

  function notif_tray:close()
		local focused = awful.screen.focused()
    focused.backdrop_notif.visible = false
    focused.notif_tray.visible = false
    awesome.emit_signal('notification_tray:closed')
	end

  function notif_tray:toggle()
    if panel_visible then
      notif_tray:close()
      panel_visible = false
    else
      notif_tray:open()
      panel_visible = true
    end
    awesome.emit_signal('modules:update')
  end

  s.backdrop_notif:connect_signal(
    'button::press',
    function()
      notif_tray:toggle()
    end
  )

  return notif_tray
end

return build