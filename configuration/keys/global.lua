local awful = require('awful')
local beautiful = require('beautiful')
local system = require('modules.system-control')

require('awful.autofocus')

local hotkeys_popup = require('modules.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').modKey
local altkey = require('configuration.keys.mod').altKey
local apps = require('configuration.apps')
local keyboard_layout = require('widgets.panel-widgets.keyboard-layout.kbdcfg')

-- Key bindings
local globalKeys = awful.util.table.join(

--  ▄▄▄▄                  ▄
-- █▀   ▀ ▄   ▄   ▄▄▄   ▄▄█▄▄   ▄▄▄   ▄▄▄▄▄
-- ▀█▄▄▄  ▀▄ ▄▀  █   ▀    █    █▀  █  █ █ █
--     ▀█  █▄█    ▀▀▀▄    █    █▀▀▀▀  █ █ █
-- ▀▄▄▄█▀  ▀█    ▀▄▄▄▀    ▀▄▄  ▀█▄▄▀  █ █ █
--         ▄▀
--        ▀▀

-- ░█░█░█▀▀░█░█░█▀▄░█▀█░█▀█░█▀▄░█▀▄
-- ░█▀▄░█▀▀░░█░░█▀▄░█░█░█▀█░█▀▄░█░█
-- ░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀░▀░▀▀░
-- awful.key(
-- 		{ 'Shift' },
-- 		'Alt_L',
-- 		function () keyboard_layout.switch_next() end
-- ),
awful.key(
  { altkey },
  'Shift_L',
  function ()
    keyboard_layout.switch_next()
  end
),
awful.key(
  { altkey },
  'F4',
  function ()
    awesome.emit_signal("module::exit_screen_show")
  end
),

-- ░█▀█░█░█░█▀▀░█▀▀░█▀█░█▄█░█▀▀
-- ░█▀█░█▄█░█▀▀░▀▀█░█░█░█░█░█▀▀
-- ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
awful.key(
  { modkey }, 'F1',
  hotkeys_popup.show_help,
  { description = 'show help', group = 'awesome' }
),
awful.key(
  { modkey, 'Control' }, 'r',
  awesome.restart,
  { description = 'reload awesome', group = 'awesome' }
),
awful.key(
  { modkey, 'Control' }, 'q',
  awesome.quit,
  { description = 'quit awesome', group = 'awesome' }
),
awful.key(
  { modkey, 'Control', 'Shift' }, 'd',
  function()
    awesome.emit_signal('debug')
  end,
  { description = 'debug', group = 'awesome' }
),

-- ░█▀▄░█▀▄░▀█▀░█▀▀░█░█░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
-- ░█▀▄░█▀▄░░█░░█░█░█▀█░░█░░█░█░█▀▀░▀▀█░▀▀█
-- ░▀▀░░▀░▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀
awful.key(
  {}, 'XF86MonBrightnessDown',
  function()
    awful.spawn('light -U 10', false)
    awesome.emit_signal('widget::brightness')
    awesome.emit_signal('module::brightness_osd:show', true)
  end,
  { description = 'decrease brightness by 10%', group = 'hotkeys' }
),
awful.key(
	{}, 'XF86MonBrightnessUp',
	function()
    awful.spawn('light -A 10', false)
    awesome.emit_signal('widget::brightness')
    awesome.emit_signal('module::brightness_osd:show', true)
	end,
	{ description = 'increase brightness by 10%', group = 'hotkeys' }
),

-- ░█▄█░█▀▀░█▀▄░▀█▀░█▀█
-- ░█░█░█▀▀░█░█░░█░░█▀█
-- ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀░▀
awful.key(
  {}, 'XF86AudioLowerVolume',
  function()
    awesome.emit_signal('widget::volume:decrease')
    awesome.emit_signal('module::volume_osd:show', true)
  end,
  { description = 'change volume up by 5%', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86AudioRaiseVolume',
  function()
    awesome.emit_signal('widget::volume:increase')
    awesome.emit_signal('module::volume_osd:show', true)
  end,
  { description = 'change volume up by 5%', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86AudioMute',
  function()
    awesome.emit_signal('widget::volume:mute', nil)
    awesome.emit_signal('module::volume_osd:show', true)
  end,
  { description = 'toggle mute', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86AudioPrev',
  function()
    awful.spawn('mpc prev', false)
  end,
  { description = 'switch music track', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86AudioNext',
  function()
    awful.spawn('mpc next', false)
  end,
  { description = 'switch music track', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86AudioPlay',
  function()
    awful.spawn('mpc toggle', false)
  end,
  { description = 'play/pause music', group = 'hotkeys' }

),
awful.key(
  {}, 'XF86AudioMicMute',
  function()
    awful.spawn('amixer set Capture toggle', false)
  end,
  { description = 'mute microphone', group = 'hotkeys' }
),

-- ░█▀█░█▀█░█░█░█▀▀░█▀▄
-- ░█▀▀░█░█░█▄█░█▀▀░█▀▄
-- ░▀░░░▀▀▀░▀░▀░▀▀▀░▀░▀
awful.key(
  {}, 'XF86PowerDown',
  function()
    --
  end,
  { description = 'shutdown skynet', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86PowerOff',
  function()
    system.suspend()
  end,
  { description = 'toggle exit screen', group = 'hotkeys' }
),
awful.key(
  {}, 'XF86Display',
  function()
    awful.spawn.single_instance('arandr', false)
  end,
  { description = 'arandr', group = 'hotkeys' }
),

-- ░█▀▀░█▀▀░█▀▄░█▀▀░█▀▀░█▀█░█▀▀░█░█░█▀█░▀█▀░█▀▀
-- ░▀▀█░█░░░█▀▄░█▀▀░█▀▀░█░█░▀▀█░█▀█░█░█░░█░░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀
awful.key(
  {}, 'Print',
  function ()
    require('modules.screenshot')('full')
  end,
  { description = 'fullscreen screenshot', group = 'Screenshots' }
),
awful.key(
  { modkey, 'Shift' }, 'Print',
  function ()
    require('modules.screenshot')('area')
  end,
  { description = 'area/selected screenshot', group = 'Screenshots' }
),
awful.key(
  { altkey }, 'Print',
  function ()
    require('modules.screenshot')('window')
  end,
  { description = 'current window screenshot', group = 'Screenshots' }
),

-- awful.key(
--     { modkey },
--     'x',
--     function()
--         awesome.emit_signal('widget::blur:toggle')
--     end,
--     { description = 'toggle blur effects', group = 'Utility' }
-- ),
-- awful.key(
--     { modkey },
--     ']',
--     function()
--         awesome.emit_signal('widget::blur:increase')
--     end,
--     { description = 'increase blur effect by 10%', group = 'Utility' }
-- ),
-- awful.key(
--     { modkey },
--     '[',
--     function()
--         awesome.emit_signal('widget::blur:decrease')
--     end,
--     { description = 'decrease blur effect by 10%', group = 'Utility' }
-- ),
-- awful.key(
--     { modkey },
--     't',
--     function()
--         awesome.emit_signal('widget::blue_light:toggle')
--     end,
--     { description = 'toggle redshift filter', group = 'Utility' }
-- ),

awful.key(
  { modkey }, 'l',
  function()
    system.lock()
  end,
  { description = 'lock the screen', group = 'Utility' }
),

-- ▄                                    ▄
-- █       ▄▄▄   ▄   ▄   ▄▄▄   ▄   ▄  ▄▄█▄▄
-- █      ▀   █  ▀▄ ▄▀  █▀ ▀█  █   █    █
-- █      ▄▀▀▀█   █▄█   █   █  █   █    █
-- █▄▄▄▄▄ ▀▄▄▀█   ▀█    ▀█▄█▀  ▀▄▄▀█    ▀▄▄
--                ▄▀
--               ▀▀
awful.key(
  { modkey, altkey}, 'Left',
  function()
    awful.tag.incmwfact(-0.05)
  end,
  { description = 'increase/decrease master width factor', group = 'layout' }
),
awful.key(
  { modkey, altkey}, 'Right',
  function()
    awful.tag.incmwfact(0.05)
  end,
  { description = 'increase/decrease master width factor', group = 'layout' }
),
awful.key(
  { modkey, altkey}, 'KP_Subtract',
  function()
    awful.tag.incnmaster(-1, nil, true)
  end,
  { description = 'increase/decrease the number of master clients', group = 'layout' }
),
awful.key(
  { modkey, altkey}, 'KP_Add',
  function()
    awful.tag.incnmaster(1, nil, true)
  end,
  { description = 'increase/decrease the number of master clients', group = 'layout' }
),
awful.key(
  { modkey, altkey}, 'Up',
  function()
    awful.tag.incncol(1, nil, true)
  end,
  { description = 'increase/decrease the number of columns', group = 'layout' }
),
awful.key(
  { modkey, altkey}, 'Down',
  function()
    awful.tag.incncol(-1, nil, true)
  end,
  { description = 'increase/decrease the number of columns', group = 'layout' }
),
awful.key(
  { modkey }, 'space',
  function()
    awful.layout.inc(1)
  end,
  { description = 'select next layout', group = 'layout' }
),
awful.key(
  { modkey, 'Shift' }, 'space',
  function()
    awful.layout.inc(-1)
  end,
  { description = 'select previous layout', group = 'layout' }
),
awful.key(
  { modkey, 'Control' }, 'space',
  function()
    awful.layout.set(awful.screen.focused().selected_tag.default_layout)
  end,
  { description = 'select default layout', group = 'layout' }
),
awful.key(
  { modkey }, 'Page_Up',
  awful.tag.viewprev,
  { description = 'view prev/next tag', group = 'tag' }
),

awful.key(
  { modkey }, 'Page_Down',
  awful.tag.viewnext,
  { description = 'view prev/next tag', group = 'tag' }
),
awful.key(
  { modkey }, 'Escape',
  awful.tag.history.restore,
  { description = 'alternate between current and previous tag', group = 'tag' }
),
awful.key(
  { modkey, 'Control' }, 'Page_Up',
  function ()
    -- tag_view_nonempty(-1)
    local focused = awful.screen.focused()
    for i = 1, #focused.tags do
        awful.tag.viewidx(-1, focused)
        if #focused.clients > 0 then
            return
        end
    end
  end,
  { description = 'view previous non-empty tag', group = 'tag' }
),
awful.key(
  { modkey, 'Control' }, 'Page_Down',
  function ()
    -- tag_view_nonempty(1)
    local focused =  awful.screen.focused()
    for i = 1, #focused.tags do
        awful.tag.viewidx(1, focused)
        if #focused.clients > 0 then
            return
        end
    end
  end,
  { description = 'view next non-empty tag', group = 'tag' }
),
awful.key(
  { modkey, 'Shift' }, 'F1',
  function()
    awful.screen.focus_relative(-1)
  end,
  { description = 'focus other screen', group = 'screen' }
),
awful.key(
  { modkey, 'Shift' }, 'F2',
  function()
    awful.screen.focus_relative(1)
  end,
  { description = 'focus other screen', group = 'screen' }
),
awful.key(
  { modkey, 'Control' }, 'n',
  function()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
        client.focus = c
        c:raise()
    end
  end,
  { description = 'restore minimized', group = 'screen' }
),

-- ▄    ▄ ▄▄▄▄▄
-- █    █   █
-- █    █   █
-- █    █   █
-- ▀▄▄▄▄▀ ▄▄█▄▄
awful.key(
  { 'Control' }, 'Escape',
  function ()
    if screen.primary.systray then
        if not screen.primary.tray_toggler then
            local systray = screen.primary.systray
            systray.visible = not systray.visible
        else
            awesome.emit_signal('widget::systray:toggle')
        end
    end
  end,
  { description = 'toggle systray visibility', group = 'Utility' }
),
awful.key(
  { altkey }, 'space',
  function()
    local focused = awful.screen.focused()
    focused.notif_tray:toggle()
  end,
  { description = 'open notification tray', group = 'launcher' }
),
awful.key(
  { modkey }, 'r',
  function()
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
  end,
  { description = 'open application drawer', group = 'launcher' }
),
awful.key(
  { modkey, 'Shift' }, 'r',
  function()
    local focused = awful.screen.focused()

    if focused.right_panel and focused.right_panel.visible then
      focused.right_panel.visible = false
    end
    screen.primary.left_panel:toggle(true)
  end,
  { description = 'open sidebar and global search', group = 'launcher' }
),
awful.key(
  { modkey }, 'F2',
  function()
    screen.primary.left_panel:toggle()
  end,
  { description = 'open favorites pane', group = 'launcher' }
),
awful.key(
  { modkey }, 'F3',
  function()
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
  end,
  { description = 'open notification center', group = 'launcher' }
),

--   ▄▄
--   ██   ▄▄▄▄   ▄▄▄▄    ▄▄▄
--  █  █  █▀ ▀█  █▀ ▀█  █   ▀
--  █▄▄█  █   █  █   █   ▀▀▀▄
-- █    █ ██▄█▀  ██▄█▀  ▀▄▄▄▀
--        █      █
--        ▀      ▀

-- ░▀█▀░█▀▀░█▀▄░█▄█░▀█▀░█▀█░█▀█░█░░
-- ░░█░░█▀▀░█▀▄░█░█░░█░░█░█░█▀█░█░░
-- ░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░▀▀▀
awful.key(
  { modkey }, '`',
  function()
    _G.toggle_quake()
  end,
  { description = 'dropdown application', group = 'launcher' }
),
awful.key(
  { modkey }, 'Return',
  function()
    awful.spawn(
      awful.screen.focused().selected_tag.default_app,
      {
        tag = mouse.screen.selected_tag,
        placement = awful.placement.bottom_right
      }
    )
  end,
  { description = 'dropdown application', group = 'launcher' }
),
awful.key(
  { 'Control', 'Shift' }, 'Escape',
  function()
    awful.spawn(apps.default.terminal .. ' -e ' .. 'htop')
  end,
  { description = 'open system monitor', group = 'launcher' }
),
awful.key(
  { modkey, 'Control', 'Shift' }, 'Escape',
  function()
    awful.spawn(apps.default.terminal .. ' -e ' .. 'bashtop')
  end,
  { description = 'open system monitor', group = 'launcher' }
),
awful.key(
  { 'Control', altkey}, 't',
  function()
    awful.spawn(apps.default.terminal)
  end,
  { description = 'open default terminal', group = 'launcher' }
),

-- ░█▄█░█▀█░▀█▀░█▀█
-- ░█░█░█▀█░░█░░█░█
-- ░▀░▀░▀░▀░▀▀▀░▀░▀
awful.key(
  { modkey }, 'e',
  function()
    awful.spawn(apps.default.file_manager)
  end,
  { description = 'open file manager', group = 'launcher' }
),
awful.key(
  { modkey }, 'b',
  function()
    awful.spawn(apps.default.web_browser)
  end,
  { description = 'open web browser', group = 'launcher' }
),
awful.key(
  { modkey }, 't',
  function()
    awful.spawn(apps.default.tor_browser)
  end,
  { description = 'open tor browser', group = 'launcher' }
),
awful.key(
  { modkey }, 'i',
  function()
    awful.spawn(apps.default.incognito_browser)
  end,
  { description = 'open web browser in incognito mode', group = 'launcher' }
),
awful.key(
  { modkey }, 'c',
  function()
    awful.spawn(apps.default.ide)
  end,
  { description = 'open default IDE', group = 'launcher' }
),

-- ░█▀▀░█▀▀░█▀▀░█▀█░█▀█░█▀▄░█▀█░█▀▄░█░█
-- ░▀▀█░█▀▀░█░░░█░█░█░█░█░█░█▀█░█▀▄░░█░
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀░░▀░▀░▀░▀░░▀░
awful.key(
  { modkey, 'Shift' }, 'm',
  function()
    awful.spawn(apps.default.music_player)
  end,
  { description = 'open default Music player', group = 'launcher' }
),
awful.key(
	{ modkey, 'Shift' }, 'v',
	function()
		awful.spawn(apps.default.video_player)
	end,
	{ description = 'open default Video Player', group = 'launcher' }
),
awful.key(
	{ modkey, 'Shift' }, 'g',
	function()
		awful.spawn(apps.default.graphics_editor)
	end,
	{ description = 'open default Graphics Editor', group = 'launcher' }
),
awful.key(
	{ modkey, 'Shift' }, 'p',
	function()
		awful.spawn(apps.default.photos_library)
	end,
	{ description = 'open default Photos Library', group = 'launcher' }
)


)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = { description = 'view tag #', group = 'tag' }
    descr_toggle = { description = 'toggle tag #', group = 'tag' }
    descr_move = { description = 'move focused client to tag #', group = 'tag' }
    descr_toggle_focus = { description = 'toggle focused client on tag #', group = 'tag' }
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      { modkey },
      '#' .. i + 9,
      function()
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
      { modkey, 'Control' },
      '#' .. i + 9,
      function()
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
      { modkey, 'Shift' },
      '#' .. i + 9,
      function()
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
      { modkey, 'Control', 'Shift' },
      '#' .. i + 9,
      function()
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
