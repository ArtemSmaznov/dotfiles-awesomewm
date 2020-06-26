local filesystem = require('gears.filesystem')

local config_dir = filesystem.get_configuration_dir()
local bin_dir = config_dir .. 'binaries/'

local sounds = require('theme.sounds')

return {

	-- The default applications that we will use in keybindings and widgets
	default = {
		terminal 									= 'terminator',																-- Terminal Emulator
		text_editor 							= 'xed',                      	            	-- GUI Text Editor
		ide												= 'code',
		game											= 'steam-runtime',
		web_browser 							= 'google-chrome-stable',                   	-- Web browser
		incognito_browser 				= 'google-chrome-stable --incognito',         -- Web browser
		file_manager 							= 'dolphin',																	-- GUI File manager
		graphics_editor						= 'gimp-2.10',
		photos_library						= 'digikam',
		vm												= 'virtualbox',
		video_player							= 'celluloid',

		network_manager 					= 'nm-connection-editor',											-- Network manager
		bluetooth_manager 				= 'blueman-manager',													-- Bluetooth manager
		power_manager 						= 'xfce4-power-manager',											-- Power manager
		package_manager 					= 'pamac-manager',														-- GUI Package manager
		-- lock 											= 'awesome-client "awesome.emit_signal(\'module::lockscreen_show\')"',	-- Lockscreen
		lock 						= 'cinnamon-screensaver-command -l',	-- Lockscreen
		quake 										= 'kitty --name QuakeTerminal',       			    					-- Quake-like Terminal

		rofiglobal								= 'rofi -dpi ' .. screen.primary.dpi ..
																' -show "Global Search" -modi "Global Search":' .. config_dir ..
																'/configuration/rofi/sidebar/rofi-spotlight.sh' ..
																' -theme ' .. config_dir ..
																'/configuration/rofi/sidebar/rofi.rasi',			 				-- Rofi Web Search


		rofiappmenu 							= 'rofi -dpi ' .. screen.primary.dpi ..
																' -show drun -theme ' .. config_dir ..
																'/configuration/rofi/appmenu/rofi.rasi'					  			-- Application Menu

		-- You can add more default applications here
	},
	
	-- List of apps to start once on start-up
	-- auto-start.lua module will start these

	run_on_start_up = {
		
		'picom -b --experimental-backends --dbus --config ' .. 
		config_dir .. '/configuration/picom.conf',   																			-- Compositor

		'blueman-applet',                                           	      								                    -- Bluetooth tray icon
		'mpd',                                                          	          										    -- Music Server
		'xfce4-power-manager',                                              	                    					    	-- Power manager
		'/usr/lib/polkit-kde-authentication-agent-1 &' .. 
		' eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', 	          									-- Credential manager
		
		'xrdb $HOME/.Xresources',                                                   	                						-- Load X Colors
		'nm-applet',                                                                    	            						-- NetworkManager Applet
		'pulseeffects --gapplication-service',                                              	        						-- Sound Equalizer
		[[
		xidlehook --not-when-fullscreen --not-when-audio --timer 600 \
		"awesome-client 'awesome.emit_signal(\"module::lockscreen_show\")'" ""
		]],																														-- Auto lock timer 
		-- 'paplay ' .. sounds.startup,
	
		-- You can add more start-up applications here
		'/opt/piavpn/bin/pia-client --quiet',
		'ckb-next -b',
		'terminator',
		-- 'google-chrome-stable',
		'/usr/bin/steam-runtime %U',
	},

	-- List of binaries/shell scripts that will execute a certain task

	bins = {
		update_profile  = bin_dir .. 'profile-image'																			-- Update profile picture
	}
}
