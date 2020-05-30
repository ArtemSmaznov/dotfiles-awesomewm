local dir = os.getenv('HOME') .. '/.config/awesome/theme/icons'
local sysThemeSymbolic = os.getenv('HOME') .. '/../../usr/share/icons/Papirus-Dark/symbolic'
local sysTheme = os.getenv('HOME') .. '/../../usr/share/icons/Papirus-Dark/64x64'

return {
  --tags
  chrome = dir .. '/google-chrome.svg',
  code = dir .. '/code-braces.svg',
  social = dir .. '/forum.svg',
  folder = dir .. '/folder.svg',
  music = dir .. '/music.svg',
  game = dir .. '/google-controller.svg',
  lab = dir .. '/flask.svg',
  graphics = sysThemeSymbolic .. '/categories/applications-graphics-symbolic.svg',
  --others
  menu = dir .. '/menu.svg',
  close = dir .. '/close.svg',
  logout = dir .. '/logout.svg',
  sleep = dir .. '/power-sleep.svg',
  power = dir .. '/power.svg',
  lock = dir .. '/lock.svg',
  restart = dir .. '/restart.svg',
  search = dir .. '/magnify.svg',
  volume = dir .. '/volume-high.svg',
  brightness = dir .. '/brightness-7.svg',
  chart = dir .. '/chart-areaspline.svg',
  memory = dir .. '/memory.svg',
  solidstatedisk = sysThemeSymbolic .. '/devices/drive-harddisk-solidstate-symbolic.svg',
  home = sysThemeSymbolic .. '/places/user-home-symbolic.svg',
  harddisk = dir .. '/harddisk.svg',
  harddisk2 = sysTheme .. '/devices/drive-harddisk.svg',
  flash = sysTheme .. '/devices/media-flash.svg',
  thermometer = dir .. '/thermometer.svg',
  plus = dir .. '/plus.svg',
  arch = sysTheme .. '/categories/distributor-logo-archlinux.svg',
  --layouts
  floating = sysThemeSymbolic .. '/actions/focus-windows-symbolic.svg'
}
