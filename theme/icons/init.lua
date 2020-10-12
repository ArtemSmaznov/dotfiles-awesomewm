-- Most icons throughout configuration are picked up from this file
-- menubar.utils.lookup_icon looks for icons in the system that match a particular application or just a file name
-- One of the places it look sfor icons is ~/.local/share/icons

local gears = require('gears')
local menubar = require("menubar")

local iconsTheme = 'Papirus-Dark'
local folder_color = 'teal'

local home_dir = os.getenv('HOME') .. '/'
local user_name = os.getenv('USER')
local theme_path = '/usr/share/icons/' .. iconsTheme .. '/'
local theme_icons = gears.filesystem.get_configuration_dir() .. 'theme/icons/'

local user_face = theme_icons .. 'default_face.svg'

local possible_faces_paths = {
  home_dir .. '.face',
  home_dir .. '.face.icon',
  '/var/lib/AccountsService/icons/' .. user_name .. '.face.icon',
}

local i = 1
while i <= #possible_faces_paths do
  if gears.filesystem.file_readable(possible_faces_paths[i]) then
    user_face = possible_faces_paths[i]
    break
  end
  i = i + 1
end

return {
  face = user_face,

  -- Tags / Virtual Desktops
  tags = {
    web_browser        = menubar.utils.lookup_icon("chrome"),
    text_editor        = menubar.utils.lookup_icon("code"),
    file_manager       = menubar.utils.lookup_icon("system-file-manager"),
    multimedia         = menubar.utils.lookup_icon("multimedia"),
    music              = menubar.utils.lookup_icon("multimedia-audio-player"),
    controller         = menubar.utils.lookup_icon("sc-controller"),
    terminal           = menubar.utils.lookup_icon("utilities-terminal"),
    graphics           = menubar.utils.lookup_icon("gpaint"),
    sandbox            = menubar.utils.lookup_icon("preferences-desktop-remote-desktop"),
  },

  -- Places / Folders
  places = {
    home_folder            = theme_path .. '64x64@2x/places/' .. 'user-' .. folder_color .. '-home.svg',
    favorites_folder       = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-favorites.svg',
    documents_folder       = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-documents.svg',
    downloads_folder       = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-download.svg',
    pictures_folder        = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-pictures.svg',
    videos_folder          = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-videos.svg',
    music_folder           = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-music.svg',
    games_folder           = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-games.svg',
    google_drive_folder    = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-google-drive.svg',
    git_folder             = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-git.svg',
    open_folder            = theme_path .. '64x64@2x/places/' .. 'folder-' .. folder_color .. '-open.svg',
    trash                  = theme_path  .. '48x48@2x/status/' .. 'user-trash.svg',
    trash_full             = theme_path  .. '48x48@2x/status/' .. 'user-trash-full.svg',
  },

  other = {
    -- Tags
    distributor_logo  = menubar.utils.lookup_icon("distributor-logo-archlinux"),


    -- Others/System UI
    logout             = menubar.utils.lookup_icon("system-log-out"),
    sleep              = menubar.utils.lookup_icon("system-suspend"),
    hibernate          = menubar.utils.lookup_icon("system-hibernate"),
    shutdown           = menubar.utils.lookup_icon("system-shutdown"),
    lock               = menubar.utils.lookup_icon("system-lock-screen"),
    restart            = menubar.utils.lookup_icon("system-reboot"),
    gear               = menubar.utils.lookup_icon("utilities-tweak-tool"),
    star               = menubar.utils.lookup_icon("package_favorite"),
    screen_recorder    = theme_path .. '64x64@2x/categories/' .. 'deepin-screen-recorder.svg',
    windows            = theme_path .. '64x64@2x/categories/' .. 'windows95.svg',

    keyboard_on        = theme_path .. '24x24@2x/panel/' .. 'input-keyboard-virtual-on.svg',
    keyboard_off       = theme_path .. '24x24@2x/panel/' .. 'input-keyboard-virtual-off.svg',
    effects            = theme_path .. '24x24@2x/actions/' .. 'autocorrection.svg',

    reddit             = theme_path .. '64x64@2x/categories/' .. 'reddit.svg',
    facebook           = theme_path .. '64x64@2x/categories/' .. 'facebook.svg',
    twitter            = theme_path .. '64x64@2x/categories/' .. 'twitter.svg',
    instagram          = theme_path .. '64x64@2x/categories/' .. 'instagram.svg',
  },

  ui = {
    close              = theme_path .. '24x24@2x/actions/' .. 'window-close.svg',
    maximize           =  theme_path .. '24x24@2x/actions/' .. 'window-new.svg',
    minimize           =  theme_path .. '24x24@2x/actions/' .. 'window-minimize.svg',
    plus               = theme_path .. '24x24@2x/actions/' .. 'window-maximize.svg',
    yes                = theme_path .. '24x24@2x/actions/' .. 'dialog-yes.svg',
    no                 = theme_path .. '24x24@2x/actions/' .. 'dialog-no.svg',
    refresh            = theme_path .. '24x24@2x/actions/' .. 'view-refresh.svg',

    toggle_on          = theme_icons .. 'toggled-on.svg',
    toggle_off         = theme_icons .. 'toggled-off.svg',
    left_arrow         = theme_icons .. 'left-arrow.svg',
    right_arrow        = theme_icons .. 'right-arrow.svg',
  },

  -- Symbolic Icons
  symbolic = {
    chart              = theme_path .. 'symbolic/actions/' .. 'image-filter-symbolic.svg',
    search             = theme_path .. 'symbolic/apps/'     .. 'preferences-system-search-symbolic.svg',
    hdd                = theme_path .. 'symbolic/devices/' .. 'drive-harddisk-system-symbolic.svg',
    sdd                = theme_path .. 'symbolic/devices/' .. 'drive-harddisk-solidstate-symbolic.svg',
    flash              = theme_path .. 'symbolic/devices/' .. 'media-flash-symbolic.svg',
    user               = theme_path .. 'symbolic/status/' .. 'user-available-symbolic.svg',
    memory             = theme_path .. 'symbolic/status/' .. 'nvidia-ram-symbolic.svg',
    thermometer        = theme_path .. 'symbolic/status/' .. 'sensors-temperature-symbolic.svg',
    network_wired      = theme_path .. 'symbolic/status/' .. 'network-wired-symbolic.svg',
    network_transmit   = theme_path .. 'symbolic/status/' .. 'network-transmit-symbolic.svg',
    bluetooth_on       = theme_path .. 'symbolic/status/' .. 'bluetooth-active-symbolic.svg',
    bluetooth_off      = theme_path .. 'symbolic/status/' .. 'bluetooth-disabled-symbolic.svg',
    music              = theme_path .. 'symbolic/places/' .. 'folder-music-symbolic.svg',
    redshift_on        = theme_path .. '24x24@2x/panel/' .. 'redshift-status-on.svg',
    redshift_off       = theme_path .. '24x24@2x/panel/' .. 'redshift-status-off.svg',
    blur_on            = theme_path .. '24x24@2x/actions/' .. 'blurfx.svg',
    blur_off           = theme_path .. '24x24@2x/actions/' .. 'blurimage.svg',

    volume = {
      high         = theme_path .. 'symbolic/status/' .. 'audio-volume-high-symbolic.svg',
      medium       = theme_path .. 'symbolic/status/' .. 'audio-volume-medium-symbolic.svg',
      low          = theme_path .. 'symbolic/status/' .. 'audio-volume-low-symbolic.svg',
      muted        = theme_path .. 'symbolic/status/' .. 'audio-volume-muted-symbolic.svg',
    },

    brightness = {
      high         = theme_path .. 'symbolic/status/' .. 'display-brightness-high-symbolic.svg',
      medium       = theme_path .. 'symbolic/status/' .. 'display-brightness-medium-symbolic.svg',
      low          = theme_path .. 'symbolic/status/' .. 'display-brightness-low-symbolic.svg',
      off          = theme_path .. 'symbolic/status/' .. 'display-brightness-off-symbolic.svg',
    },

    updates = {
      uptodate     = theme_path .. 'symbolic/status/' .. 'arch-uptodate-symbolic.svg',
      available    = theme_path .. 'symbolic/status/' .. 'software-update-available-symbolic.svg',
      urgent       = theme_path .. 'symbolic/status/' .. 'software-update-urgent-symbolic.svg',
    },

    -- Network
    network = {
      airplane_mode_on   = theme_path .. 'symbolic/status/' .. 'airplane-mode-symbolic.svg',
      airplane_mode_off  = theme_path .. 'symbolic/status/' .. 'airplane-mode-disabled-symbolic.svg',
      loading            = theme_path .. 'symbolic/status/' .. 'content-loading-symbolic.svg',

      wired              = theme_path .. 'symbolic/status/' .. 'network-wired-symbolic.svg',
      wired_connecting   = theme_path .. 'symbolic/status/' .. 'network-wired-acquiring-symbolic.svg',
      wired_off          = theme_path .. 'symbolic/status/' .. 'network-wired-disconnected-symbolic.svg',
      wired_error        = theme_path .. 'symbolic/status/' .. 'network-wired-error-symbolic.svg',
      wired_no_route     = theme_path .. 'symbolic/status/' .. 'network-wired-no-route-symbolic.svg',

      wifi_1             = theme_path .. 'symbolic/status/' .. 'network-wireless-signal-none-symbolic.svg',
      wifi_2             = theme_path .. 'symbolic/status/' .. 'network-wireless-signal-weak-symbolic.svg',
      wifi_3             = theme_path .. 'symbolic/status/' .. 'network-wireless-signal-ok-symbolic.svg',
      wifi_4             = theme_path .. 'symbolic/status/' .. 'network-wireless-signal-good-symbolic.svg',
      wifi_5             = theme_path .. 'symbolic/status/' .. 'network-wireless-signal-excellent-symbolic.svg',
      wifi               = theme_path .. 'symbolic/status/' .. 'network-wireless-symbolic.svg',
      wifi_connecting    = theme_path .. 'symbolic/status/' .. 'network-wireless-acquiring-symbolic.svg',
      wifi_on            = theme_path .. 'symbolic/status/' .. 'network-wireless-connected-symbolic.svg',
      wifi_off           = theme_path .. 'symbolic/status/' .. 'network-wireless-disconnected-symbolic.svg',
      wifi_lock          = theme_path .. 'symbolic/status/' .. 'network-wireless-encrypted-symbolic.svg',
      wifi_error         = theme_path .. 'symbolic/status/' .. 'network-wireless-error-symbolic.svg',
      wifi_hotspot       = theme_path .. 'symbolic/status/' .. 'network-wireless-hotspot-symbolic.svg',
      wifi_no_route      = theme_path .. 'symbolic/status/' .. 'network-wireless-no-route-symbolic.svg',
    },

    -- Battery Status
    battery = {
      battery                = theme_path .. 'symbolic/status/' .. 'battery-symbolic.svg',
      batt_charging          = theme_path .. 'symbolic/status/' .. 'battery-full-charging-symbolic.svg',
      batt_discharging       = theme_path .. 'symbolic/status/' .. 'battery-symbolic.svg',
      battery_unknown        = theme_path .. 'symbolic/status/' .. 'battery-missing-symbolic.svg',
      battery_0              = theme_path .. 'symbolic/status/' .. 'battery-level-0-symbolic.svg',
      battery_10             = theme_path .. 'symbolic/status/' .. 'battery-level-10-symbolic.svg',
      battery_20             = theme_path .. 'symbolic/status/' .. 'battery-level-20-symbolic.svg',
      battery_30             = theme_path .. 'symbolic/status/' .. 'battery-level-30-symbolic.svg',
      battery_40             = theme_path .. 'symbolic/status/' .. 'battery-level-40-symbolic.svg',
      battery_50             = theme_path .. 'symbolic/status/' .. 'battery-level-50-symbolic.svg',
      battery_60             = theme_path .. 'symbolic/status/' .. 'battery-level-60-symbolic.svg',
      battery_70             = theme_path .. 'symbolic/status/' .. 'battery-level-70-symbolic.svg',
      battery_80             = theme_path .. 'symbolic/status/' .. 'battery-level-80-symbolic.svg',
      battery_90             = theme_path .. 'symbolic/status/' .. 'battery-level-90-symbolic.svg',
      battery_100            = theme_path .. 'symbolic/status/' .. 'battery-level-100-symbolic.svg',
      battery_charging_0     = theme_path .. 'symbolic/status/' .. 'battery-level-0-charging-symbolic.svg',
      battery_charging_10    = theme_path .. 'symbolic/status/' .. 'battery-level-10-charging-symbolic.svg',
      battery_charging_20    = theme_path .. 'symbolic/status/' .. 'battery-level-20-charging-symbolic.svg',
      battery_charging_30    = theme_path .. 'symbolic/status/' .. 'battery-level-30-charging-symbolic.svg',
      battery_charging_40    = theme_path .. 'symbolic/status/' .. 'battery-level-40-charging-symbolic.svg',
      battery_charging_50    = theme_path .. 'symbolic/status/' .. 'battery-level-50-charging-symbolic.svg',
      battery_charging_60    = theme_path .. 'symbolic/status/' .. 'battery-level-60-charging-symbolic.svg',
      battery_charging_70    = theme_path .. 'symbolic/status/' .. 'battery-level-70-charging-symbolic.svg',
      battery_charging_80    = theme_path .. 'symbolic/status/' .. 'battery-level-80-charging-symbolic.svg',
      battery_charging_90    = theme_path .. 'symbolic/status/' .. 'battery-level-90-charging-symbolic.svg',
      battery_charging_100   = theme_path .. 'symbolic/status/' .. 'battery-level-100-charged-symbolic.svg',
      mouse_battery_0        = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-empty.svg',
      mouse_battery_20       = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-caution.svg',
      mouse_battery_40       = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-low.svg',
      mouse_battery_60       = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-medium.svg',
      mouse_battery_80       = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-good.svg',
      mouse_battery_100      = theme_path .. '24x24@2x/panel/' .. 'mouse-battery-full.svg',
      keyboard_battery_0     = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-empty.svg',
      keyboard_battery_20    = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-caution.svg',
      keyboard_battery_40    = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-low.svg',
      keyboard_battery_60    = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-medium.svg',
      keyboard_battery_80    = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-good.svg',
      keyboard_battery_100   = theme_path .. '24x24@2x/panel/' .. 'keyboard-battery-full.svg',
    },
  },

  weather = {
    sunrise          = theme_path .. 'symbolic/status/' .. 'daytime-sunrise-symbolic.svg',
    sunset           = theme_path .. 'symbolic/status/' .. 'daytime-sunset-symbolic.svg',

    windy            = theme_path .. '24x24@2x/panel/weather-' .. 'windy' .. '.svg',
    clouds_many      = theme_path .. '24x24@2x/panel/weather-' .. 'many-clouds' .. '.svg',
    mist             = theme_path .. '24x24@2x/panel/weather-' .. 'fog' .. '.svg',
    snow_rain        = theme_path .. '24x24@2x/panel/weather-' .. 'snow-rain' .. '.svg',
    freezing_rain    = theme_path .. '24x24@2x/panel/weather-' .. 'many-clouds' .. '.svg',
    hail             = theme_path .. '24x24@2x/panel/weather-' .. 'hail' .. '.svg',
    error            = theme_path .. '24x24@2x/panel/weather-' .. 'none-available' .. '.svg',

    day_clear                = theme_path .. '24x24@2x/panel/weather-' .. 'clear' .. '.svg',
    day_clouds_few           = theme_path .. '24x24@2x/panel/weather-' .. 'few-clouds' .. '.svg',
    day_clouds               = theme_path .. '24x24@2x/panel/weather-' .. 'clouds' .. '.svg',
    day_showers              = theme_path .. '24x24@2x/panel/weather-' .. 'showers-day' .. '.svg',
    day_showers_scattered    = theme_path .. '24x24@2x/panel/weather-' .. 'showers-scattered-day' .. '.svg',
    day_storm                = theme_path .. '24x24@2x/panel/weather-' .. 'storm-day' .. '.svg',
    day_snow                 = theme_path .. '24x24@2x/panel/weather-' .. 'snow-day' .. '.svg',
    day_snow_scattered       = theme_path .. '24x24@2x/panel/weather-' .. 'snow-scattered-day' .. '.svg',

    night_clear              = theme_path .. '24x24@2x/panel/weather-' .. 'clear-night' .. '.svg',
    night_clouds_few         = theme_path .. '24x24@2x/panel/weather-' .. 'few-clouds-night' .. '.svg',
    night_clouds             = theme_path .. '24x24@2x/panel/weather-' .. 'clouds-night' .. '.svg',
    night_showers            = theme_path .. '24x24@2x/panel/weather-' .. 'showers-night' .. '.svg',
    night_showers_scattered  = theme_path .. '24x24@2x/panel/weather-' .. 'showers-scattered-night' .. '.svg',
    night_storm              = theme_path .. '24x24@2x/panel/weather-' .. 'storm-night' .. '.svg',
    night_snow               = theme_path .. '24x24@2x/panel/weather-' .. 'snow-night' .. '.svg',
    night_snow_scattered     = theme_path .. '24x24@2x/panel/weather-' .. 'snow-scattered-night' .. '.svg',

  },

}
