-- User profile widget
-- Optional dependency:
--    mugshot (use to update profile picture and information)

local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local dpi = beautiful.xresources.apply_dpi

local apps = require('configuration.apps')

local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'configuration/user-profile/'

local user_icon_dir = '/var/lib/AccountsService/icons/'

local profile_imagebox = wibox.widget {
	{
		id = 'icon',
		forced_height = dpi(45),
		forced_width = dpi(45),
		image = widget_icon_dir .. 'default' .. '.svg',
		clip_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius) end,
		widget = wibox.widget.imagebox,
		resize = true
	},
	layout = wibox.layout.align.horizontal
}

local profile_name = wibox.widget {
	font = "SF Pro Text Bold 14",
	markup = 'User',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox
}

local distro_name = wibox.widget {
	font = "SF Pro Text Regular 11",
	markup = 'GNU/Linux',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox
}

local kernel_version = wibox.widget {
	font = "SF Pro Text Regular 10",
	markup = 'Linux',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox
}

local uptime_time = wibox.widget {
	font = "SF Pro Text Regular 10",
	markup = 'up 1 minute',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox
}

local update_profile_image = function()
	awful.spawn.easy_async_with_shell(
		apps.bins.update_profile,
		function(stdout)
			stdout = stdout:gsub('%\n','')
			if not stdout:match("default") then
				profile_imagebox.icon:set_image(stdout)
			else
				profile_imagebox.icon:set_image(widget_icon_dir .. 'default.svg')
			end
		end
	)
end

update_profile_image()

awful.spawn.easy_async_with_shell(
	"printf \"$(whoami)@$(hostname)\"",
	function(stdout) 
		local stdout = stdout:gsub('%\n', '')
		-- stdout = stdout:sub(1,1):upper() .. stdout:sub(2)
		profile_name:set_markup(stdout)
	end
)

awful.spawn.easy_async_with_shell(
	[[
	cat /etc/os-release | awk 'NR==1'| awk -F '"' '{print $2}'
	]],
	function(stdout)
		local distroname = stdout:gsub('%\n', '')
		distro_name:set_markup(distroname)
	end
)

awful.spawn.easy_async_with_shell(
	'uname -r',
	function(stdout)
		local kname = stdout:gsub('%\n', '')
		kernel_version:set_markup(kname)
	end
)

local update_uptime = function()
	awful.spawn.easy_async_with_shell(
		"uptime -p",
		function(stdout)
			local uptime = stdout:gsub('%\n','')
			uptime_time:set_markup(uptime)		
		end
	)
end

local uptime_updater_timer = gears.timer{
	timeout = 60,
	autostart = true,
	call_now = true,
	callback = function()
		update_uptime()
	end
}

local user_profile = wibox.widget {
	{
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(10),
			{
				layout = wibox.layout.align.vertical,
				expand = 'none',
				nil,
				profile_imagebox,
				nil
			},
			{
				layout = wibox.layout.align.vertical,
				expand = 'none',
				nil,
				{
					layout = wibox.layout.fixed.vertical,
					profile_name,
					distro_name,
					kernel_version,
					uptime_time
				},
				nil
			}
		},
		margins = dpi(10),
		widget = wibox.container.margin
	},
	forced_height = dpi(92),
	bg = beautiful.groups_bg,
	shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius) end,
	widget = wibox.container.background
	
}

user_profile:connect_signal(
	'mouse::enter',
	function() 
		update_uptime()
	end
)

return user_profile
