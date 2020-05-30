-- Icons directory
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/'

local sysTheme = 'Papirus-Dark'

local themePath = '/usr/share/icons/' .. sysTheme .. '/'
local sysPath = themePath .. '64x64@2x/'
local sysPath48 = '/usr/share/icons/' .. sysTheme .. '/48x48@2x/'
local placesPath = sysPath .. 'places/'

return {

	-- Tags
	web_browser 		= sysPath .. 'categories/' .. 'chrome.svg',
	text_editor			= sysPath .. 'categories/' .. 'code.svg',
	file_manager 		= sysPath .. 'categories/' .. 'system-file-manager.svg',
	multimedia 			= sysPath .. 'categories/' .. 'applications-multimedia.svg',
	music 					= sysPath .. 'categories/' .. 'multimedia-audio-player.svg',
	controller 			= sysPath .. 'categories/' .. 'sc-controller.svg',
	sandbox 				= sysPath .. 'apps/' .. 'preferences-desktop-remote-desktop.svg',
	terminal 				= sysPath .. 'categories/' .. 'terminal.svg',
	graphics 				= sysPath .. 'categories/' .. 'gpaint.svg',
	development 		= dir .. 'tag-list/' .. 'development.svg',
	social					= dir .. 'tag-list/' .. 'social.svg',
	menu 						= dir .. 'tag-list/' .. 'menu.svg',
	close_small 		= dir .. 'tag-list/' .. 'close-small.svg',

	-- Places
	home_folder 					= placesPath .. 'user-blue-home.svg',
	favorites_folder 			= placesPath .. 'folder-blue-favorites.svg',
	documents_folder 			= placesPath .. 'folder-blue-documents.svg',
	downloads_folder 			= placesPath .. 'folder-blue-download.svg',
	pictures_folder 			= placesPath .. 'folder-blue-pictures.svg',
	videos_folder 				= placesPath .. 'folder-blue-videos.svg',
	music_folder 					= placesPath .. 'folder-blue-music.svg',
	games_folder 					= placesPath .. 'folder-blue-games.svg',
	google_drive_folder 	= placesPath .. 'folder-blue-google-drive.svg',
	git_folder 						= placesPath .. 'folder-blue-git.svg',
	open_folder 						= placesPath .. 'folder-blue-open.svg',
	trash 								= sysPath48	..	'status/' .. 'user-trash.svg',
	trash_full 								= sysPath48	..	'status/' .. 'user-trash-full.svg',

	-- Others/System UI
	close 						= dir .. 'close.svg',
	logout						= dir .. 'logout.svg',
	sleep 						= dir .. 'power-sleep.svg',
	power 						= dir .. 'power.svg',
	lock 							= dir .. 'lock.svg',
	restart 					= dir .. 'restart.svg',
	search 						= dir .. 'magnify.svg',
	volume 						= dir .. 'volume-high.svg',
	brightness 				= dir .. 'brightness-7.svg',
	effects 					= dir .. 'effects.svg',
	chart 						= dir .. 'chart-areaspline.svg',
	memory 						= dir .. 'memory.svg',
	harddisk 					= dir .. 'harddisk.svg',
	thermometer 			= dir .. 'thermometer.svg',
	plus 							= dir .. 'plus.svg',
	batt_charging 		= dir .. 'battery-charge.svg',
	batt_discharging	= dir .. 'battery-discharge.svg',
	toggled_on 				= dir .. 'toggled-on.svg',
	toggled_off				= dir .. 'toggled-off.svg',
	yes								= themePath .. '24x24@2x/actions/' .. 'dialog-yes.svg',
	no								= themePath .. '24x24@2x/actions/' .. 'dialog-no.svg',

}
