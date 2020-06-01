local naughty = require('naughty')
local awful = require('awful')

local snap = function(mode)
	local screenshot_dir = os.getenv('HOME') .. '/Pictures/Screenshots/'
	local notif_message = 'Screenshot Captured!'
	local file_name = os.date("%Y-%m-%d_%T") .. '.png'
	local file_loc = screenshot_dir .. file_name

	local maim_command
	if (mode == 'full') then
		maim_command = "-u -m 1"
		notif_message = "Full screenshot saved and copied to clipboard!"
	elseif (mode == 'window') then
		maim_command = "-u -B -i $(xdotool getactivewindow) -m 1"
		notif_message = "Current window screenshot saved and copied to clipboard!"
	elseif (mode == 'area') then
		maim_command = "-u -s -n -m 1"
		notif_message = "Area screenshot saved and copied to clipboard!"
	end


	local open_image = naughty.action {
		name = 'Open',
			 icon_only = false,
	}

	local open_folder = naughty.action {
		name = 'Folder',
			 icon_only = false,
	}

	local delete_image = naughty.action {
		name = 'Delete',
			 icon_only = false,
	}

	-- Execute the callback when 'Open' is pressed
	open_image:connect_signal('invoked', function()
		awful.spawn('xdg-open ' .. file_loc, false)
	end)

	open_folder:connect_signal('invoked', function()
		awful.spawn('xdg-open ' .. screenshot_dir, false)
	end)

	-- Execute the callback when 'Delete' is pressed
	delete_image:connect_signal('invoked', function()
		awful.spawn('gio trash ' .. file_loc, false)
	end)

	-- Show notification
	naughty.notification ({
		app_name = 'Screenshot Tool',
		icon = file_loc,
		timeout = 10,
		title = '<b>Snap!</b>',
		message = notif_message,
		actions = { open_image, open_folder, delete_image }
	})

	return awful.spawn('maim ' .. maim_command .. ' '.. file_loc)
end

return snap

