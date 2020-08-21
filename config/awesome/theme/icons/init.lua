-- Icons directory
local menubar = require("menubar")

local iconsTheme = 'Papirus-Dark'

local themePath = '/usr/share/icons/' .. iconsTheme .. '/'
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/'

return {

	-- Tags / Virtual Desktops
	tags = {
		web_browser 			= menubar.utils.lookup_icon("chrome"),
		text_editor				= menubar.utils.lookup_icon("code"),
		file_manager 			= menubar.utils.lookup_icon("system-file-manager"),
		multimedia 				= menubar.utils.lookup_icon("multimedia"),
		music 						= menubar.utils.lookup_icon("multimedia-audio-player"),
		controller 				= menubar.utils.lookup_icon("sc-controller"),
		terminal 					= menubar.utils.lookup_icon("utilities-terminal"),
		graphics 					= menubar.utils.lookup_icon("gpaint"),
		sandbox 					= menubar.utils.lookup_icon("preferences-desktop-remote-desktop"),
	},

	-- Places / Folders
	places = {
		home_folder 					= themePath .. '64x64@2x/places/' .. 'user-blue-home.svg',
		favorites_folder 			= themePath .. '64x64@2x/places/' .. 'folder-blue-favorites.svg',
		documents_folder 			= themePath .. '64x64@2x/places/' .. 'folder-blue-documents.svg',
		downloads_folder 			= themePath .. '64x64@2x/places/' .. 'folder-blue-download.svg',
		pictures_folder 			= themePath .. '64x64@2x/places/' .. 'folder-blue-pictures.svg',
		videos_folder 				= themePath .. '64x64@2x/places/' .. 'folder-blue-videos.svg',
		music_folder 					= themePath .. '64x64@2x/places/' .. 'folder-blue-music.svg',
		games_folder 					= themePath .. '64x64@2x/places/' .. 'folder-blue-games.svg',
		google_drive_folder 	= themePath .. '64x64@2x/places/' .. 'folder-blue-google-drive.svg',
		git_folder 						= themePath .. '64x64@2x/places/' .. 'folder-blue-git.svg',
		open_folder 					= themePath .. '64x64@2x/places/' .. 'folder-blue-open.svg',
		trash 								= themePath	.. '48x48@2x/status/' .. 'user-trash.svg',
		trash_full 						= themePath	.. '48x48@2x/status/' .. 'user-trash-full.svg',
	},

	other = {
		-- Tags
		distributor_logo	= menubar.utils.lookup_icon("distributor-logo-archlinux"),


		-- Others/System UI
		logout						= menubar.utils.lookup_icon("system-log-out"),
		sleep							= menubar.utils.lookup_icon("system-suspend"),
		hibernate					= menubar.utils.lookup_icon("system-hibernate"),
		shutdown					= menubar.utils.lookup_icon("system-shutdown"),
		lock							= menubar.utils.lookup_icon("system-lock-screen"),
		restart						= menubar.utils.lookup_icon("system-reboot"),
		gear							= menubar.utils.lookup_icon("utilities-tweak-tool"),
		screen_recorder		= themePath .. '64x64@2x/categories/' .. 'deepin-screen-recorder.svg',
		windows 					= themePath .. '64x64@2x/categories/' .. 'windows95.svg',

		keyboard_on				= themePath .. '24x24@2x/panel/' .. 'input-keyboard-virtual-on.svg',
		keyboard_off			= themePath .. '24x24@2x/panel/' .. 'input-keyboard-virtual-off.svg',
		effects 					= themePath .. '24x24@2x/actions/' .. 'autocorrection.svg',

		reddit						= themePath .. '64x64@2x/categories/' .. 'reddit.svg',
		facebook					= themePath .. '64x64@2x/categories/' .. 'facebook.svg',
		twitter						= themePath .. '64x64@2x/categories/' .. 'twitter.svg',
		instagram					= themePath .. '64x64@2x/categories/' .. 'instagram.svg',
	},

	ui = {
		close 						= themePath .. '24x24@2x/actions/' .. 'window-close.svg',
		maximize					=	themePath .. '24x24@2x/actions/' .. 'window-new.svg',
		minimize					=	themePath .. '24x24@2x/actions/' .. 'window-minimize.svg',
		plus 							= themePath .. '24x24@2x/actions/' .. 'window-maximize.svg',
		yes								= themePath .. '24x24@2x/actions/' .. 'dialog-yes.svg',
		no								= themePath .. '24x24@2x/actions/' .. 'dialog-no.svg',
		refresh						= themePath .. '24x24@2x/actions/' .. 'view-refresh.svg',

		toggle_on 				= dir .. 'toggled-on.svg',
		toggle_off				= dir .. 'toggled-off.svg',
		left_arrow				= dir .. 'left-arrow.svg',
		right_arrow				= dir .. 'right-arrow.svg',
	},

	-- Symbolic Icons
	symbolic = {
		chart 						= themePath .. 'symbolic/actions/' .. 'image-filter-symbolic.svg',
		search 						= themePath .. 'symbolic/apps/'		 .. 'preferences-system-search-symbolic.svg',
		hdd 							= themePath .. 'symbolic/devices/' .. 'drive-harddisk-system-symbolic.svg',
		sdd								= themePath .. 'symbolic/devices/' .. 'drive-harddisk-solidstate-symbolic.svg',
		flash							= themePath .. 'symbolic/devices/' .. 'media-flash-symbolic.svg',
		user							= themePath .. 'symbolic/status/' .. 'user-available-symbolic.svg',
		memory 						= themePath .. 'symbolic/status/' .. 'nvidia-ram-symbolic.svg',
		thermometer 			= themePath .. 'symbolic/status/' .. 'sensors-temperature-symbolic.svg',
		network_wired 		= themePath .. 'symbolic/status/' .. 'network-wired-symbolic.svg',
		network_transmit	= themePath .. 'symbolic/status/' .. 'network-transmit-symbolic.svg',
		bluetooth_on			= themePath .. 'symbolic/status/' .. 'bluetooth-active-symbolic.svg',
		bluetooth_off			= themePath .. 'symbolic/status/' .. 'bluetooth-disabled-symbolic.svg',
		music							= themePath .. 'symbolic/places/' .. 'folder-music-symbolic.svg',
    redshift_on				= themePath .. '24x24@2x/panel/' .. 'redshift-status-on.svg',
    redshift_off			= themePath .. '24x24@2x/panel/' .. 'redshift-status-off.svg',
    blur_on     			= themePath .. '24x24@2x/actions/' .. 'blurfx.svg',
    blur_off     			= themePath .. '24x24@2x/actions/' .. 'blurimage.svg',

		volume = {
			high				= themePath .. 'symbolic/status/' .. 'audio-volume-high-symbolic.svg',
			medium			= themePath .. 'symbolic/status/' .. 'audio-volume-medium-symbolic.svg',
			low					= themePath .. 'symbolic/status/' .. 'audio-volume-low-symbolic.svg',
			muted				= themePath .. 'symbolic/status/' .. 'audio-volume-muted-symbolic.svg',
		},

		brightness = {
			high				= themePath .. 'symbolic/status/' .. 'display-brightness-high-symbolic.svg',
			medium			= themePath .. 'symbolic/status/' .. 'display-brightness-medium-symbolic.svg',
			low					= themePath .. 'symbolic/status/' .. 'display-brightness-low-symbolic.svg',
			off					= themePath .. 'symbolic/status/' .. 'display-brightness-off-symbolic.svg',
		},

		updates = {
			uptodate		= themePath .. 'symbolic/status/' .. 'arch-uptodate-symbolic.svg',
			available		= themePath .. 'symbolic/status/' .. 'arch-updates-symbolic.svg',
			urgent			= themePath .. 'symbolic/status/' .. 'software-update-urgent-symbolic.svg',
    },

		-- Network
		network = {
			airplane_mode_on 	= themePath .. 'symbolic/status/' .. 'airplane-mode-symbolic.svg',
			airplane_mode_off = themePath .. 'symbolic/status/' .. 'airplane-mode-disabled-symbolic.svg',
			loading						= themePath .. 'symbolic/status/' .. 'content-loading-symbolic.svg',

			wired							= themePath .. 'symbolic/status/' .. 'network-wired-symbolic.svg',
			wired_connecting	= themePath .. 'symbolic/status/' .. 'network-wired-acquiring-symbolic.svg',
			wired_off					= themePath .. 'symbolic/status/' .. 'network-wired-disconnected-symbolic.svg',
			wired_error				= themePath .. 'symbolic/status/' .. 'network-wired-error-symbolic.svg',
			wired_no_route		= themePath .. 'symbolic/status/' .. 'network-wired-no-route-symbolic.svg',

			wifi_1 						= themePath .. 'symbolic/status/' .. 'network-wireless-signal-none-symbolic.svg',
			wifi_2 						= themePath .. 'symbolic/status/' .. 'network-wireless-signal-weak-symbolic.svg',
			wifi_3 						= themePath .. 'symbolic/status/' .. 'network-wireless-signal-ok-symbolic.svg',
			wifi_4 						= themePath .. 'symbolic/status/' .. 'network-wireless-signal-good-symbolic.svg',
			wifi_5 						= themePath .. 'symbolic/status/' .. 'network-wireless-signal-excellent-symbolic.svg',
			wifi							= themePath .. 'symbolic/status/' .. 'network-wireless-symbolic.svg',
			wifi_connecting		= themePath .. 'symbolic/status/' .. 'network-wireless-acquiring-symbolic.svg',
			wifi_on						= themePath .. 'symbolic/status/' .. 'network-wireless-connected-symbolic.svg',
			wifi_off					= themePath .. 'symbolic/status/' .. 'network-wireless-disconnected-symbolic.svg',
			wifi_lock					= themePath .. 'symbolic/status/' .. 'network-wireless-encrypted-symbolic.svg',
			wifi_error				= themePath .. 'symbolic/status/' .. 'network-wireless-error-symbolic.svg',
			wifi_hotspot			= themePath .. 'symbolic/status/' .. 'network-wireless-hotspot-symbolic.svg',
			wifi_no_route			= themePath .. 'symbolic/status/' .. 'network-wireless-no-route-symbolic.svg',
		},

		-- Battery Status
		battery = {
			battery								= themePath .. 'symbolic/status/' .. 'battery-symbolic.svg',
			batt_charging 				= themePath .. 'symbolic/status/' .. 'battery-full-charging-symbolic.svg',
			batt_discharging			= themePath .. 'symbolic/status/' .. 'battery-symbolic.svg',
			battery_unknown				= themePath .. 'symbolic/status/' .. 'battery-missing-symbolic.svg',
			battery_0							= themePath .. 'symbolic/status/' .. 'battery-level-0-symbolic.svg',
			battery_10						= themePath .. 'symbolic/status/' .. 'battery-level-10-symbolic.svg',
			battery_20						= themePath .. 'symbolic/status/' .. 'battery-level-20-symbolic.svg',
			battery_30						= themePath .. 'symbolic/status/' .. 'battery-level-30-symbolic.svg',
			battery_40						= themePath .. 'symbolic/status/' .. 'battery-level-40-symbolic.svg',
			battery_50						= themePath .. 'symbolic/status/' .. 'battery-level-50-symbolic.svg',
			battery_60						= themePath .. 'symbolic/status/' .. 'battery-level-60-symbolic.svg',
			battery_70						= themePath .. 'symbolic/status/' .. 'battery-level-70-symbolic.svg',
			battery_80						= themePath .. 'symbolic/status/' .. 'battery-level-80-symbolic.svg',
			battery_90						= themePath .. 'symbolic/status/' .. 'battery-level-90-symbolic.svg',
			battery_100						= themePath .. 'symbolic/status/' .. 'battery-level-100-symbolic.svg',
			battery_charging_0		= themePath .. 'symbolic/status/' .. 'battery-level-0-charging-symbolic.svg',
			battery_charging_10		= themePath .. 'symbolic/status/' .. 'battery-level-10-charging-symbolic.svg',
			battery_charging_20		= themePath .. 'symbolic/status/' .. 'battery-level-20-charging-symbolic.svg',
			battery_charging_30		= themePath .. 'symbolic/status/' .. 'battery-level-30-charging-symbolic.svg',
			battery_charging_40		= themePath .. 'symbolic/status/' .. 'battery-level-40-charging-symbolic.svg',
			battery_charging_50		= themePath .. 'symbolic/status/' .. 'battery-level-50-charging-symbolic.svg',
			battery_charging_60		= themePath .. 'symbolic/status/' .. 'battery-level-60-charging-symbolic.svg',
			battery_charging_70		= themePath .. 'symbolic/status/' .. 'battery-level-70-charging-symbolic.svg',
			battery_charging_80		= themePath .. 'symbolic/status/' .. 'battery-level-80-charging-symbolic.svg',
			battery_charging_90		= themePath .. 'symbolic/status/' .. 'battery-level-90-charging-symbolic.svg',
			battery_charging_100	= themePath .. 'symbolic/status/' .. 'battery-level-100-charged-symbolic.svg',
			mouse_battery_0				= themePath .. '24x24@2x/panel/' .. 'mouse-battery-empty.svg',
			mouse_battery_20			= themePath .. '24x24@2x/panel/' .. 'mouse-battery-caution.svg',
			mouse_battery_40			= themePath .. '24x24@2x/panel/' .. 'mouse-battery-low.svg',
			mouse_battery_60			= themePath .. '24x24@2x/panel/' .. 'mouse-battery-medium.svg',
			mouse_battery_80			= themePath .. '24x24@2x/panel/' .. 'mouse-battery-good.svg',
			mouse_battery_100			= themePath .. '24x24@2x/panel/' .. 'mouse-battery-full.svg',
			keyboard_battery_0		= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-empty.svg',
			keyboard_battery_20		= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-caution.svg',
			keyboard_battery_40		= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-low.svg',
			keyboard_battery_60		= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-medium.svg',
			keyboard_battery_80		= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-good.svg',
			keyboard_battery_100	= themePath .. '24x24@2x/panel/' .. 'keyboard-battery-full.svg',
		},
	},

	weather = {
		sunrise					= themePath .. 'symbolic/status/' .. 'daytime-sunrise-symbolic.svg',
		sunset					= themePath .. 'symbolic/status/' .. 'daytime-sunset-symbolic.svg',

		windy		 				= themePath .. '24x24@2x/panel/weather-' .. 'windy' .. '.svg',
		clouds_many			= themePath .. '24x24@2x/panel/weather-' .. 'many-clouds' .. '.svg',
		mist	 					= themePath .. '24x24@2x/panel/weather-' .. 'fog' .. '.svg',
		snow_rain				= themePath .. '24x24@2x/panel/weather-' .. 'snow-rain' .. '.svg',
		freezing_rain		= themePath .. '24x24@2x/panel/weather-' .. 'many-clouds' .. '.svg',
		hail						= themePath .. '24x24@2x/panel/weather-' .. 'hail' .. '.svg',
		error						= themePath .. '24x24@2x/panel/weather-' .. 'none-available' .. '.svg',

		day_clear								= themePath .. '24x24@2x/panel/weather-' .. 'clear' .. '.svg',
		day_clouds_few					= themePath .. '24x24@2x/panel/weather-' .. 'few-clouds' .. '.svg',
		day_clouds							= themePath .. '24x24@2x/panel/weather-' .. 'clouds' .. '.svg',
		day_showers 						= themePath .. '24x24@2x/panel/weather-' .. 'showers-day' .. '.svg',
		day_showers_scattered 	= themePath .. '24x24@2x/panel/weather-' .. 'showers-scattered-day' .. '.svg',
		day_storm 							= themePath .. '24x24@2x/panel/weather-' .. 'storm-day' .. '.svg',
		day_snow 								= themePath .. '24x24@2x/panel/weather-' .. 'snow-day' .. '.svg',
		day_snow_scattered			= themePath .. '24x24@2x/panel/weather-' .. 'snow-scattered-day' .. '.svg',

		night_clear							= themePath .. '24x24@2x/panel/weather-' .. 'clear-night' .. '.svg',
		night_clouds_few				= themePath .. '24x24@2x/panel/weather-' .. 'few-clouds-night' .. '.svg',
		night_clouds						= themePath .. '24x24@2x/panel/weather-' .. 'clouds-night' .. '.svg',
		night_showers 					= themePath .. '24x24@2x/panel/weather-' .. 'showers-night' .. '.svg',
		night_showers_scattered = themePath .. '24x24@2x/panel/weather-' .. 'showers-scattered-night' .. '.svg',
		night_storm 						= themePath .. '24x24@2x/panel/weather-' .. 'storm-night' .. '.svg',
		night_snow 							= themePath .. '24x24@2x/panel/weather-' .. 'snow-night' .. '.svg',
		night_snow_scattered		= themePath .. '24x24@2x/panel/weather-' .. 'snow-scattered-night' .. '.svg',

	},

}
