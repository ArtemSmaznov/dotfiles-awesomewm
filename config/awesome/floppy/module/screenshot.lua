local naughty = require('naughty')
local awful = require('awful')

return function(mode)
	local screenshot_dir = os.getenv('HOME') .. '/Pictures/Screenshots/'
	local notif_message = 'Screenshot Captured!'
	local file_loc = screenshot_dir .. os.date("%Y-%m-%d_%H-%M-%S") .. '.png'
	-- local file_loc = screenshot_dir .. os.date("%Y-%m-%d_%T") .. '.png'

	if (mode == 'full') then
		awful.spawn('maim -u -m 1 '.. file_loc)
		notif_message = "Full screenshot saved and copied to clipboard!"

	elseif (mode == 'window') then
		awful.spawn.with_shell('maim -u -B -i $(xdotool getactivewindow) -m 1 '.. file_loc)
		notif_message = "Current window screenshot saved and copied to clipboard!"

	elseif (mode == 'area') then
		awful.spawn('maim -u -s -n -m 1 '.. file_loc)
		notif_message = "Area screenshot saved and copied to clipboard!"

	else
		notif_message = "Wrong Argument Used!"
	end

	awful.spawn('xclip -selection clipboard -t image/png -i ' .. file_loc)

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

end