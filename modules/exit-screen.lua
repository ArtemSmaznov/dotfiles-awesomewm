local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local system = require('modules.system-control')

local dpi = beautiful.xresources.apply_dpi

local icons = require('theme.icons')
local apps = require('configuration.apps')
local clickable_container = require('widgets.system-elements.clickable-container.with-background')

local filesystem = gears.filesystem
local config_dir = filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'configuration/user-profile/'
local bin_dir = '${HOME}/.local/bin/'

local greeter_message = wibox.widget {
	markup = 'Till Next Time!',
	font = 'SF Pro Text UltraLight 48',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

local profile_name = wibox.widget {
	-- markup = 'user@hostname',
	markup = 'user',
	font = 'SF Pro Text Regular 12',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

local profile_imagebox = wibox.widget {
  image = icons.face,
	resize = true,
	forced_height = dpi(110),
	clip_shape = gears.shape.circle,
	widget = wibox.widget.imagebox
}

local profile_imagebox_bg = wibox.widget {
	bg = beautiful.groups_bg,
    forced_width = dpi(120),
    forced_height = dpi(120),
    shape = gears.shape.circle,
    widget = wibox.container.background
}

local update_user_name = function()
	awful.spawn.easy_async_with_shell(
		"printf \"$(whoami)@$(hostname)\"",
		function(stdout)
			local stdout = stdout:gsub('%\n','')
			local username = stdout:match("(.*)@")
			username = username:sub(1, 1):upper() .. username:sub(2)
			greeter_message:set_markup('Till next time, ' .. username .. '!')
			profile_name:set_markup(stdout)
		end
	)
end

update_user_name()

local build_button = function(icon, name)

	local button_text = wibox.widget {
		text = name,
		font = beautiful.font,
		align = 'center',
		valign = 'center',
		widget = wibox.widget.textbox
	}

	local a_button = wibox.widget {
		{
			{
				{
					{
						image = icon,
						widget = wibox.widget.imagebox
					},
					margins = dpi(16),
					widget = wibox.container.margin
				},
				bg = beautiful.groups_bg,
				widget = wibox.container.background
			},
			shape = gears.shape.rounded_rect,
			forced_width = dpi(90),
			forced_height = dpi(90),
			widget = clickable_container
		},
		left = dpi(24),
		right = dpi(24),
		widget = wibox.container.margin
	}

	local build_a_button = wibox.widget {
		layout = wibox.layout.fixed.vertical,
		spacing = dpi(5),
		a_button,
		button_text
	}

	return build_a_button
end

-- ░█▀▀░█▀█░█▄█░█▄█░█▀█░█▀█░█▀▄░█▀▀
-- ░█░░░█░█░█░█░█░█░█▀█░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀░▀░▀░▀░▀▀░░▀▀▀

local lock_command = function()
	awesome.emit_signal("module::exit_screen_hide")
  system.lock()
end

local suspend_command = function()
	awesome.emit_signal("module::exit_screen_hide")
  system.suspend()
end

local reboot_command = function()
  awesome.emit_signal("module::exit_screen_hide")
  system.reboot()
end

local shutdown_command = function()
	awesome.emit_signal("module::exit_screen_hide")
  system.shutdown()
end

local windows_command = function()
  awesome.emit_signal("module::exit_screen_hide")
  system.reboot_to_windows()
end

local logout_command = function()
  system.logout()
end

-- ░█▀▄░█░█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
-- ░█▀▄░█░█░░█░░░█░░█░█░█░█░▀▀█
-- ░▀▀░░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀░▀▀▀

local lock = build_button(icons.other.lock, 'Lock')
lock:connect_signal('button::release',
	function()
		lock_command()
	end
)

local suspend = build_button(icons.other.sleep, '(S)leep')
suspend:connect_signal('button::release',
	function()
		suspend_command()
	end
)

local reboot = build_button(icons.other.restart, '(R)estart')
reboot:connect_signal('button::release',
	function()
		reboot_command()
	end
)

local poweroff = build_button(icons.other.shutdown, 'Shut(D)own')
poweroff:connect_signal('button::release',
	function()
		shutdown_command()
	end
)

local windows = build_button(icons.other.windows, '(W)indows')
windows:connect_signal('button::release',
  function()
		windows_command()
	end
)

local logout = build_button(icons.other.logout, '(L)ogout')
logout:connect_signal('button::release',
	function()
		logout_command()
	end
)

------------------------------------

screen.connect_signal(
	"request::desktop_decoration",
	function(s)

		s.exit_screen = wibox
		{
			screen = s,
			type = 'splash',
			visible = false,
			ontop = true,
			bg = beautiful.background,
			fg = beautiful.fg_normal,
			height = s.geometry.height,
			width = s.geometry.width,
			x = s.geometry.x,
			y = s.geometry.y
		}

		local exit_screen_hide = function()
			awesome.emit_signal("module::exit_screen_hide")
		end


		local exit_screen_grabber = awful.keygrabber {
			auto_start          = true,
			stop_event          = 'release',
			keypressed_callback = function(self, mod, key, command)

-- ░█░█░█▀█░▀█▀░█░█░█▀▀░█░█░█▀▀
-- ░█▀█░█░█░░█░░█▀▄░█▀▀░░█░░▀▀█
-- ░▀░▀░▀▀▀░░▀░░▀░▀░▀▀▀░░▀░░▀▀▀

        if key == 's' then
					suspend_command()

				elseif key == 'r' then
          reboot_command()

				elseif key == 'd' then
					shutdown_command()

				elseif key == 'w' then
          windows_command()

				elseif key == 'l' then
					logout_command()

				elseif key == 'Escape' or key == 'q' or key == 'x' then
					awesome.emit_signal("module::exit_screen_hide")
				end

			end
		}

		awesome.connect_signal(
			"module::exit_screen_show",
			function()
				for s in screen do
					s.exit_screen.visible = false
				end
				awful.screen.focused().exit_screen.visible = true
				exit_screen_grabber:start()
			end
		)

		awesome.connect_signal(
			"module::exit_screen_hide",
			function()
				exit_screen_grabber:stop()
				for s in screen do
					s.exit_screen.visible = false
				end
			end
		)

		s.exit_screen : buttons(
			gears.table.join(
				awful.button(
					{},
					2,
					function()
						awesome.emit_signal("module::exit_screen_hide")
					end
				),
				awful.button(
					{},
					3,
					function()
						awesome.emit_signal("module::exit_screen_hide")
					end
				)
			)
		)

		s.exit_screen : setup {
			nil,
			{
				nil,
				{
					{
						nil,
						{
							layout = wibox.layout.fixed.vertical,
							spacing = dpi(5),
							{
								profile_imagebox_bg,
								{
									layout = wibox.layout.align.vertical,
									expand = 'none',
									nil,
									{
										layout = wibox.layout.align.horizontal,
										expand = 'none',
										nil,
										profile_imagebox,
										nil
									},
									nil
								},
								layout = wibox.layout.stack
							},
							profile_name
						},
						nil,
						expand = 'none',
						layout = wibox.layout.align.horizontal
					},
					{
						layout = wibox.layout.align.horizontal,
						expand = 'none',
						nil,
						{
							{
								greeter_message,
								{
                  lock,
									suspend,
									reboot,
                  poweroff,
                  windows,
									logout,
									layout = wibox.layout.fixed.horizontal
								},
								spacing = dpi(30),
								layout = wibox.layout.fixed.vertical
							},
							spacing = dpi(40),
							layout = wibox.layout.fixed.vertical
						},
						nil
					},
					spacing = dpi(40),
					layout = wibox.layout.fixed.vertical
				},
				nil,
				expand = 'none',
				layout = wibox.layout.align.horizontal
			},
			nil,
			expand = 'none',
			layout = wibox.layout.align.vertical
		}

	end
)