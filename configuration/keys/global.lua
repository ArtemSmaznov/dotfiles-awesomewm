local awful = require('awful')
local system = require('modules.system-control')

require('awful.autofocus')

local hotkeys_popup = require('modules.hotkeys_popup').widget

local mod = require('configuration.keys.mod').mod
local alt = require('configuration.keys.mod').alt
local ctrl = require('configuration.keys.mod').ctrl
local shift = require('configuration.keys.mod').shift

local apps = require('configuration.apps')
local keyboard_layout = require('widgets.panel-widgets.keyboard-layout.kbdcfg')

-- Key bindings
local globalKeys = awful.util.table.join(

-- ░█▀▀░█░█░█▀▀░▀█▀░█▀▀░█▄█
-- ░▀▀█░░█░░▀▀█░░█░░█▀▀░█░█
-- ░▀▀▀░░▀░░▀▀▀░░▀░░▀▀▀░▀░▀

-- Awesome
awful.key({mod}, 'F1', hotkeys_popup.show_help, {description='show help', group='awesome'}),
awful.key({mod, ctrl}, 'r', awesome.restart, {description='reload awesome', group='awesome'}),
awful.key({mod, ctrl}, 'q', awesome.quit, {description='quit awesome', group='awesome'}),
awful.key({mod, ctrl, shift}, 'd', function()
    awesome.emit_signal('debug')
  end, {description='debug', group='awesome'}),

-- Switch Keyboard Layouts
awful.key({shift}, 'Alt_L', function()
      keyboard_layout.switch_next()
    end),
-- awful.key({altkey}, 'Shift_L',
--   function()
--     keyboard_layout.switch_next()
--   end),

-- Brightness Keys
awful.key({}, 'XF86MonBrightnessDown', function()
    awful.spawn('light -U 10', false)
    awesome.emit_signal('widget::brightness')
    awesome.emit_signal('module::brightness_osd:show', true)
  end),
awful.key({}, 'XF86MonBrightnessUp', function()
    awful.spawn('light -A 10', false)
    awesome.emit_signal('widget::brightness')
    awesome.emit_signal('module::brightness_osd:show', true)
	end),
-- Media Keys
awful.key({}, 'XF86AudioLowerVolume', function()
    awesome.emit_signal('widget::volume:decrease')
    awesome.emit_signal('module::volume_osd:show', true)
  end),
awful.key({}, 'XF86AudioRaiseVolume', function()
    awesome.emit_signal('widget::volume:increase')
    awesome.emit_signal('module::volume_osd:show', true)
  end),
awful.key({}, 'XF86AudioMute', function()
    awesome.emit_signal('widget::volume:mute', nil)
    awesome.emit_signal('module::volume_osd:show', true)
  end),
awful.key({}, 'XF86AudioPrev', function()
    awful.spawn('mpc prev', false)
  end),
awful.key({}, 'XF86AudioNext', function()
    awful.spawn('mpc next', false)
  end),
awful.key({}, 'XF86AudioPlay', function()
    awful.spawn('mpc toggle', false)
  end
),
awful.key({}, 'XF86AudioMicMute', function()
    awful.spawn('amixer set Capture toggle', false)
  end),

-- Power Control
awful.key({alt}, 'F4', function()
    awesome.emit_signal("module::exit_screen_show")
  end),
awful.key({}, 'XF86PowerDown', function()
    --
  end),
awful.key({}, 'XF86PowerOff', function()
    system.suspend()
  end),
awful.key({}, 'XF86Display', function()
    awful.spawn.single_instance('arandr', false)
  end),
-- awful.key({mod}, 'l', function()
--     system.lock()
--   end, {description='lock the screen', group='Utility'}),


-- ░█▀▀░█▀▀░█▀▄░█▀▀░█▀▀░█▀█░█▀▀░█░█░█▀█░▀█▀░
-- ░▀▀█░█░░░█▀▄░█▀▀░█▀▀░█░█░▀▀█░█▀█░█░█░░█░░
-- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░

awful.key({ctrl}, 'Print', function()
    awful.spawn('/home/artem/.local/bin/dmscripts/dmscreenshot full')
  end, {description='Full Desktop Screenshot', group='Screenshots'}),
awful.key({}, 'Print', function()
    awful.spawn('/home/artem/.local/bin/dmscripts/dmscreenshot screen')
  end, {description='Fullscreen Screenshot', group='Screenshots'}),
awful.key({mod, shift}, 'Print', function()
    awful.spawn('/home/artem/.local/bin/dmscripts/dmscreenshot area')
  end, {description='Selection Area Screenshot', group='Screenshots'}),
awful.key({alt}, 'Print', function()
    awful.spawn('/home/artem/.local/bin/dmscripts/dmscreenshot window')
  end, {description='Current Window Screenshot', group='Screenshots'}),


-- ░█▄█░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▄░█▀▀
-- ░█░█░█░█░█░█░░█░░░█░░█░█░█▀▄░▀▀█
-- ░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀

-- Switch focus between monitors
awful.key({mod, alt}, 'Tab', function()
    awful.screen.focus_relative(1)
  end, {description='Move focus to other monitor', group='screen'}),

awful.key({mod, alt}, 'h', function()
    awful.screen.focus_bydirection('left')
  end, {description='Move focus to prev monitor', group='screen'}),
awful.key({mod, alt}, 'l', function()
    awful.screen.focus_bydirection("right")
  end, {description='Move focus to next monitor', group='screen'}),


-- ░▀█▀░█▀█░█▀▀░█▀▀
-- ░░█░░█▀█░█░█░▀▀█
-- ░░▀░░▀░▀░▀▀▀░▀▀▀

awful.key({mod}, 'Tab',
  awful.tag.history.restore,
  {description='alternate between current and previous tag', group='tag'}),
awful.key({mod}, 'Page_Up',
  awful.tag.viewprev,
  {description='view prev/next tag', group='tag'}),
awful.key({mod}, 'Page_Down',
  awful.tag.viewnext,
  {description='view prev/next tag', group='tag'}),

-- Default client focus
awful.key({mod}, '`',	awful.client.urgent.jumpto,	{description = 'jump to urgent client', group = 'client'}),

awful.key({mod, ctrl}, 'Page_Up', function()
    -- tag_view_nonempty(-1)
    local focused = awful.screen.focused()
    for i = 1, #focused.tags do
        awful.tag.viewidx(-1, focused)
        if #focused.clients > 0 then
            return
        end
    end
  end, {description='view previous non-empty tag', group='tag'}),
awful.key({mod, ctrl}, 'Page_Down', function()
    -- tag_view_nonempty(1)
    local focused =  awful.screen.focused()
    for i = 1, #focused.tags do
        awful.tag.viewidx(1, focused)
        if #focused.clients > 0 then
            return
        end
    end
  end, {description='view next non-empty tag', group='tag'}),


-- ░█░░░█▀█░█░█░█▀█░█░█░▀█▀░█▀▀
-- ░█░░░█▀█░░█░░█░█░█░█░░█░░▀▀█
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░░▀░░▀▀▀

-- Toggle between different layouts
awful.key({mod}, 'space', function()
    awful.layout.inc(1)
  end, {description='Toggle between layouts', group='layout'}),
awful.key({mod, shift}, 'space', function()
    awful.layout.inc(-1)
  end, {description='Toggle between layouts', group='layout'}),
awful.key({mod, ctrl}, 'space', function()
    awful.layout.set(awful.screen.focused().selected_tag.default_layout)
  end, {description='Select default layout', group='layout'}),

-- Switch between windows
awful.key({mod}, 'h',	function() awful.client.focus.bydirection('left')
  end, {description = 'Move focus to left', group = 'client'}),
awful.key({mod}, 'l',	function() awful.client.focus.bydirection('right')
	end, {description = 'Move focus to right', group = 'client'}),
awful.key({mod}, 'j',	function() awful.client.focus.bydirection('down')
	end, {description = 'Move focus to down', group = 'client'}),
awful.key({mod}, 'k',	function() awful.client.focus.bydirection('up')
	end, {description = 'Move focus to up', group = 'client'}),
awful.key({alt}, 'Tab',	function()
		awful.client.focus.byidx(-1)
	end, {description = 'Move window focus to other window', group = 'client'}),

-- Move windows between left/right columns or move up/down in current stack.
awful.key({mod, shift}, 'h',	function() awful.client.swap.bydirection('left')
  end, {description = 'Move focus to left', group = 'client'}),
awful.key({mod, shift}, 'l',	function() awful.client.swap.bydirection('right')
	end, {description = 'Move focus to right', group = 'client'}),
awful.key({mod, shift}, 'j',	function() awful.client.swap.bydirection('down')
	end, {description = 'Move focus to down', group = 'client'}),
awful.key({mod, shift}, 'k',	function() awful.client.swap.bydirection('up')
	end, {description = 'Move focus to up', group = 'client'}),
awful.key({alt}, 'Tab',	function()
		awful.client.focus.byidx(-1)
	end, {description = 'Move window focus to other window', group = 'client'}),

-- Grow windows
awful.key({mod, ctrl}, 'h', function()
    awful.tag.incmwfact(-0.05)
  end, {description='Grow window to the left', group='layout'}),
awful.key({mod, ctrl}, 'l', function()
    awful.tag.incmwfact(0.05)
  end, {description='Grow window to the right', group='layout'}),

awful.key({mod}, 'Left', function()
    awful.tag.incncol(1, nil, true)
  end, {description='increase/decrease the number of columns', group='layout'}),
awful.key({mod}, 'Right', function()
    awful.tag.incncol(-1, nil, true)
  end, {description='increase/decrease the number of columns', group='layout'}),

awful.key({mod}, 'Up', function()
    awful.tag.incnmaster(1, nil, true)
  end, {description='increase/decrease the number of master clients', group='layout'}),
awful.key({mod}, 'Down', function()
    awful.tag.incnmaster(-1, nil, true)
  end, {description='increase/decrease the number of master clients', group='layout'}),

awful.key({mod, shift}, 'd', function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        client.focus = c
        c:raise()
    end
  end, {description='restore minimized', group='client'}),

-- move floating client to center
awful.key({ mod, ctrl }, 'c', function(c)
		local focused = awful.screen.focused()
		awful.placement.centered(c, {
			honor_workarea = true
		})
	end, {description = 'move client to center of the screen', group = "client"}),


-- ░█░█░▀█▀
-- ░█░█░░█░
-- ░▀▀▀░▀▀▀

awful.key({ctrl}, 'Escape', function()
    if screen.primary.systray then
        if not screen.primary.tray_toggler then
            local systray = screen.primary.systray
            systray.visible = not systray.visible
        else
            awesome.emit_signal('widget::systray:toggle')
        end
    end
  end, {description='toggle systray visibility', group='Utility'}),

awful.key({alt}, 'space', function()
    local focused = awful.screen.focused()
    focused.notif_tray:toggle()
  end, {description='open notification tray', group='launcher'}),

awful.key({mod}, 'r', function()
    local focused = awful.screen.focused()

    if focused.left_panel then
      focused.left_panel:HideDashboard()
      focused.left_panel.opened = false
    end
    if focused.right_panel then
      focused.right_panel:HideDashboard()
      focused.right_panel.opened = false
    end
    awful.spawn(apps.default.rofiappmenu, false)
  end, {description='open application drawer', group='launcher'}),

awful.key({mod, alt}, 'F2', function()
    local focused = awful.screen.focused()

    if focused.right_panel and focused.right_panel.visible then
      focused.right_panel.visible = false
    end
    screen.primary.left_panel:toggle(true)
  end, {description='open sidebar and global search', group='launcher'}),

awful.key({mod}, 'F2', function()
    screen.primary.left_panel:toggle()
  end, {description='open favorites pane', group='launcher'}),

awful.key({mod}, 'F3', function()
    local focused = awful.screen.focused()

    if focused.left_panel and focused.left_panel.opened then
      focused.left_panel:toggle()
    end

    if focused.right_panel then
      if _G.right_panel_mode == 'today_mode' or not focused.right_panel.visible then
        focused.right_panel:toggle()
        switch_rdb_pane('today_mode')
      else
        switch_rdb_pane('today_mode')
      end

      _G.right_panel_mode = 'today_mode'
    end
  end, {description='open notification center', group='launcher'}),





-------



-- ░█▀█░█▀█░█▀█░█▀▀
-- ░█▀█░█▀▀░█▀▀░▀▀█
-- ░▀░▀░▀░░░▀░░░▀▀▀


-- Terminal
-- awful.key(
--   {modkey}, '`',
--   function()
--     _G.toggle_quake()
--   end,
--   {description='dropdown application', group='launcher'}
-- ),

-- awful.key({mod}, 'Return', function()
--     awful.spawn(
--       awful.screen.focused().selected_tag.default_app,
--       {
--         tag = mouse.screen.selected_tag,
--         placement = awful.placement.bottom_right
--      }
--     )
--   end, {description='dropdown application', group='launcher'}),

awful.key({mod}, 'Return', function()
    awful.spawn(apps.default.terminal)
  end, {description='Launch terminal', group='launcher'}),

-- Main Applications launched with SUPER + KEY
awful.key({mod}, 'e', function()
    awful.spawn(apps.default.file_manager)
  end, {description='Launch file manager', group='launcher'}),
awful.key({mod}, 'b', function()
    awful.spawn(apps.default.web_browser)
  end, {description='Launch web browser', group='launcher'}),
awful.key({mod}, 'i', function()
    awful.spawn(apps.default.incognito_browser)
  end, {description='Launch browser in incognito', group='launcher'}),

-- Secondary Applications launched with CTRL + ALT + KEY
awful.key({ctrl, alt}, 't', function()
    awful.spawn(apps.default.terminal)
  end, {description='Launch terminal', group='launcher'}),

awful.key({ctrl, alt}, 'm', function()
    awful.spawn(apps.default.music_player)
  end, {description='open default Music player', group='launcher'}),
awful.key({ctrl, alt}, 'v', function()
		awful.spawn(apps.default.video_player)
	end, {description='open default Video Player', group='launcher'}),
awful.key({ctrl, alt}, 'g', function()
		awful.spawn(apps.default.graphics_editor)
	end, {description='open default Graphics Editor', group='launcher'}),
awful.key({ctrl, alt}, 'p', function()
		awful.spawn(apps.default.photos_library)
	end, {description='open default Photos Library', group='launcher'}),

awful.key({mod}, 't', function()
    awful.spawn(apps.default.tor_browser)
  end, {description='Launch tor browser', group='launcher'}),
awful.key({mod}, 'c', function()
    awful.spawn(apps.default.ide)
  end, {description='open default IDE', group='launcher'}),




awful.key({ctrl, shift}, 'Escape', function()
    awful.spawn(apps.default.terminal .. ' -e ' .. 'htop')
  end, {description='open system monitor', group='launcher'}),
awful.key({mod, ctrl, shift}, 'Escape', function()
    awful.spawn(apps.default.terminal .. ' -e ' .. 'bashtop')
  end, {description='open system monitor', group='launcher'})

)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description='view tag #', group='tag'}
    descr_toggle = {description='toggle tag #', group='tag'}
    descr_move = {description='move focused client to tag #', group='tag'}
    descr_toggle_focus = {description='toggle focused client on tag #', group='tag'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {mod},
      '#' .. i + 9, function()
        local focused = awful.screen.focused()
        -- local tag = focused.tags[i]
        local tag = screen.primary.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {mod, ctrl},
      '#' .. i + 9, function()
        local focused = awful.screen.focused()
          -- local tag = focused.tags[i]
          local tag = screen.primary.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {mod, shift},
      '#' .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {mod, ctrl, shift},
      '#' .. i + 9, function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:toggle_tag(tag)
            end
          end
      end,
      descr_toggle_focus
    )
  )
end

return globalKeys
