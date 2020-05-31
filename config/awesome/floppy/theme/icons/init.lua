-- Icons directory
local iconsTheme = 'Papirus-Dark'

local themePath = '/usr/share/icons/' .. iconsTheme .. '/'
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/'

return {

	-- Tags
	web_browser 		= themePath .. '64x64@2x/categories/' .. 'chrome.svg',
	text_editor			= themePath .. '64x64@2x/categories/' .. 'code.svg',
	file_manager 		= themePath .. '64x64@2x/categories/' .. 'system-file-manager.svg',
	multimedia 			= themePath .. '64x64@2x/categories/' .. 'applications-multimedia.svg',
	music 					= themePath .. '64x64@2x/categories/' .. 'multimedia-audio-player.svg',
	controller 			= themePath .. '64x64@2x/categories/' .. 'sc-controller.svg',
	terminal 				= themePath .. '64x64@2x/categories/' .. 'terminal.svg',
	graphics 				= themePath .. '64x64@2x/categories/' .. 'gpaint.svg',
	sandbox 				= themePath .. '64x64@2x/apps/' 			.. 'preferences-desktop-remote-desktop.svg',
	development 		= dir .. 'tag-list/' .. 'development.svg',
	social					= dir .. 'tag-list/' .. 'social.svg',

	-- Places
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

	-- Others/System UI
	close 						= themePath .. '24x24@2x/actions/' .. 'window-close.svg',
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
	plus 							= themePath .. '24x24@2x/actions/' .. 'window-maximize.svg',
	batt_charging 		= dir .. 'battery-charge.svg',
	batt_discharging	= dir .. 'battery-discharge.svg',
	toggled_on 				= dir .. 'toggled-on.svg',
	toggled_off				= dir .. 'toggled-off.svg',
	gear							= themePath .. '64x64@2x/categories/' .. 'utilities-tweak-tool.svg',
	yes								= themePath .. '24x24@2x/actions/' .. 'dialog-yes.svg',
	no								= themePath .. '24x24@2x/actions/' .. 'dialog-no.svg',
	maximize					=	themePath .. '24x24@2x/actions/' .. 'window-new.svg',
	minimize					=	themePath .. '24x24@2x/actions/' .. 'window-minimize.svg',

}
