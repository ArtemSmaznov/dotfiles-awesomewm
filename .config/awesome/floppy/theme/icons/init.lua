-- Icons directory
local sysTheme = 'Papirus-Dark'

local sysPath = '/usr/share/icons/' .. sysTheme .. '/64x64@2x/'
local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons/'

return {

	-- Tags
	web_browser 		= sysPath .. 'categories/' .. 'chrome.svg',
	text_editor			= sysPath .. 'categories/' .. 'code.svg',
	file_manager 		= sysPath .. 'categories/' .. 'system-file-manager.svg',
	multimedia 			= sysPath .. 'categories/' .. 'applications-multimedia.svg',
	music 					= sysPath .. 'categories/' .. 'multimedia-audio-player.svg',
	games 					= sysPath .. 'categories/' .. 'sc-controller.svg',
	sandbox 				= sysPath .. 'apps/' .. 'preferences-desktop-remote-desktop.svg',
	terminal 				= sysPath .. 'categories/' .. 'terminal.svg',
	graphics 				= sysPath .. 'categories/' .. 'gpaint.svg',
	development 		= dir .. 'tag-list/' .. 'development.svg',
	social					= dir .. 'tag-list/' .. 'social.svg',
	menu 						= dir .. 'tag-list/' .. 'menu.svg',
	close_small 		= dir .. 'tag-list/' .. 'close-small.svg',

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
	toggled_off				= dir .. 'toggled-off.svg'

}
