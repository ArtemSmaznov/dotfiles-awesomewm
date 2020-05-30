local categories = "/usr/share/icons/Papirus-Dark/64x64@2x/categories/"
local symbolic = "/usr/share/icons/Papirus-Dark/symbolic/"
local actions = "/usr/share/icons/Papirus-Dark/24x24@2x/actions/"

return{
    -- Start Menu
	arch = categories .. "distributor-logo-archlinux.svg",
	-- System
	audio_high = symbolic .. "status/audio-volume-high-symbolic.svg",
	audio_med = symbolic .. "status/audio-volume-medium-symbolic.svg",
	audio_low = symbolic .. "status/audio-volume-low-symbolic.svg",
	audio_muted = symbolic .. "status/audio-volume-muted-symbolic.svg",
	temp = symbolic .. "status/sensors-temperature-symbolic.svg",
	hdd = symbolic .. "devices/drive-harddisk-system-symbolic.svg",
	sdd = symbolic .. "devices/drive-harddisk-solidstate-symbolic.svg",
	-- Navigation
	arrow_up = actions .. "arrow-up.svg",
	arrow_down = actions .. "arrow-down.svg",
	arrow_left = actions .. "arrow-left.svg",
	arrow_right = actions .. "arrow-right.svg",
    -- Tags
		code = categories .. "appimagekit-kitty.svg",
    chrome = categories .. "chrome.svg",
    controller = categories .. "sc-controller.svg",
    brush = categories .. "gpaint.svg",
    files = categories .. "winefile.svg",
		layers = categories .. "asc-de.svg",
		
		codeSym = symbolic .. "apps/utilities-terminal-symbolic.svg",
		chromeSym = symbolic .. "apps/google-chrome-symbolic.svg",
    controllerSym = symbolic .. "categories/applications-games-symbolic.svg",
		paintSym = symbolic .. "categories/applications-graphics-symbolic.svg",
		filesSym = symbolic .. "apps/system-file-manager-symbolic.svg",
		vmSym = symbolic .. "apps/preferences-desktop-remote-desktop-symbolic.svg"
}