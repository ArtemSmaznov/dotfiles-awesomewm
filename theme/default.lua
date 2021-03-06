local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local filesystem = require('gears.filesystem')

local theme_dir = filesystem.get_configuration_dir() .. '/theme'
local system_dir = '/usr/share/awesome/themes/default/layouts/'

local titlebar_theme = "stoplight"
local titlebar_icon_path = theme_dir .. "/icons/titlebar/" .. titlebar_theme .. '/'
local tip = titlebar_icon_path

local user = require('configuration.preferences')
local material = require('theme.colors.material')

local theme = {}

-- Theme defaults
local font         = user.theme.font or 'SF Pro Text'
local font_regular = font .. ' Regular 10'
local font_bold    = font .. ' Bold 10'
local font_title   = font .. ' Bold 14'
local icons        = 'Papirus-Dark'
local wallpaper    = '/usr/share/backgrounds/archlinux/small.png'


--------------------------------------------------------
-- Setting the defaults
--------------------------------------------------------
theme.font       = font_regular
theme.font_bold  = font_bold
theme.title_font = font_title
theme.icon_theme = user.theme.icons      or icons
theme.wallpaper  = user.theme.wallpaper  or wallpaper


--------------------------------------------------------
-- Color scheme
--------------------------------------------------------
theme.transparent = '#00000000'
theme.toggle = material.blue_grey.hue_700
theme.system_elements = material.grey.hue_100
theme.accent = material.grey.hue_300
theme.background = material.black .. '66'

theme.fg_normal = material.white .. 'de'
theme.fg_focus = material.grey.hue_300
theme.fg_urgent = material.red.hue_200

theme.bg_normal = theme.background
theme.bg_focus = material.grey.hue_700
theme.bg_urgent = material.grey.hue_800


--------------------------------------------------------
-- UI
--------------------------------------------------------
-- System tray
theme.systray_icon_spacing = dpi(user.theme.systray_icon_spacing or 3)
theme.bg_systray = material.black

-- Titlebar
theme.titlebar_size = dpi(user.theme.titlebar_size or 34)
theme.titlebar_bg_focus = beautiful.gtk.get_theme_variables().bg_color:sub(1,7) .. '66'
theme.titlebar_bg_normal = beautiful.gtk.get_theme_variables().base_color:sub(1,7) .. '66'
theme.titlebar_fg_focus = beautiful.gtk.get_theme_variables().fg_color .. '00'
theme.titlebar_fg_normal = beautiful.gtk.get_theme_variables().fg_color .. '00'














-- UI Groups
theme.groups_title_bg = material.white .. "15"
theme.groups_bg = material.white .. "10"
theme.groups_radius = dpi(9)

-- Client Decorations

-- Borders
theme.border_focus = beautiful.gtk.get_theme_variables().bg_color
theme.border_normal = beautiful.gtk.get_theme_variables().base_color
theme.border_marked = material.red.hue_200
theme.border_width = dpi(0)
theme.border_radius = dpi(0)

-- Decorations
theme.client_radius = dpi(9)
theme.useless_gap = dpi(4)

-- Menu
theme.menu_font = "SF Pro Text Regular 11"
theme.menu_submenu = '' -- ➤

theme.menu_height = dpi(34)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(20)
theme.menu_bg_focus = theme.accent .. 'CC'

theme.menu_bg_normal =  theme.background:sub(1,7) .. '33'
theme.menu_fg_normal = material.white
theme.menu_fg_focus = material.white
theme.menu_border_color = theme.background:sub(1,7) .. '5C'

-- Tooltips
theme.tooltip_bg = theme.background
theme.tooltip_border_color = theme.transparent
theme.tooltip_border_width = 0
theme.tooltip_gaps = dpi(15)
-- theme.tooltip_shape = function(cr, w, h)
--   gears.shape.rounded_rect(cr, w, h, dpi(6))
-- end

-- Separators
theme.separator_color = material.grey.hue_100 .. '44'

-- Taglist
theme.taglist_bg_empty = theme.background .. '99'
theme.taglist_bg_occupied =  material.white .. '1A'
theme.taglist_bg_urgent = material.pink.hue_500 .. '99'
theme.taglist_bg_focus = theme.background
theme.taglist_spacing = dpi(0)

-- Tasklist
theme.tasklist_font = 'SF Pro Text Regular 10'
theme.tasklist_bg_normal = material.white .. '20'
theme.tasklist_bg_focus = theme.background
theme.tasklist_bg_urgent = material.pink.hue_500 .. '99'
theme.tasklist_fg_focus = material.grey.hue_300
theme.tasklist_fg_urgent = material.white
theme.tasklist_fg_normal = material.grey.hue_500

-- Notification
theme.notification_position = 'top_right'
theme.notification_bg = theme.transparent
theme.notification_margin = dpi(5)
theme.notification_border_width = dpi(0)
theme.notification_border_color = theme.transparent
theme.notification_spacing = dpi(0)
theme.notification_icon_resize_strategy = 'center'
theme.notification_icon_size = dpi(32)

-- Client Snap Theme
theme.snap_bg = theme.background
theme.snap_shape = gears.shape.rectangle
theme.snap_border_width = dpi(15)

-- Hotkey popup
theme.hotkeys_font = 'SF Pro Text Bold'
theme.hotkeys_description_font   = 'SF Pro Text Regular Regular'
theme.hotkeys_bg = theme.background
theme.hotkeys_group_margin = dpi(20)












--------------------------------------------------------
-- Icons
--------------------------------------------------------
theme.awesome_icon = theme_dir .. '/icons/awesome.svg'
theme.dir = theme_dir
theme.icons = theme.dir .. '/icons/'

-- Titlebar
theme.titlebar_close_button_normal                    = tip .. "close_normal.svg"
theme.titlebar_close_button_focus                     = tip .. "close_focus.svg"
theme.titlebar_minimize_button_normal                 = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus                  = tip .. "minimize_focus.svg"
theme.titlebar_ontop_button_normal_inactive           = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive            = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active             = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active              = tip .. "ontop_focus_active.svg"
theme.titlebar_sticky_button_normal_inactive          = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive           = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active            = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active             = tip .. "sticky_focus_active.svg"
theme.titlebar_floating_button_normal_inactive        = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive         = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active          = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active           = tip .. "floating_focus_active.svg"
theme.titlebar_maximized_button_normal_inactive       = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive        = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active         = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active          = tip .. "maximized_focus_active.svg"
theme.titlebar_close_button_normal_hover              = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover               = tip .. "close_focus_hover.svg"
theme.titlebar_minimize_button_normal_hover           = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover            = tip .. "minimize_focus_hover.svg"
theme.titlebar_ontop_button_normal_inactive_hover     = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover      = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover       = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover        = tip .. "ontop_focus_active_hover.svg"
theme.titlebar_sticky_button_normal_inactive_hover    = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover     = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover      = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover       = tip .. "sticky_focus_active_hover.svg"
theme.titlebar_floating_button_normal_inactive_hover  = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover   = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover    = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover     = tip .. "floating_focus_active_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover   = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover    = tip .. "maximized_focus_active_hover.svg"

-- Layoutbox icons
theme.layout_max        = system_dir .. 'maxw.png'
theme.layout_tile       = system_dir .. 'tilew.png'
theme.layout_dwindle    = system_dir .. 'dwindlew.png'
theme.layout_floating   = system_dir .. 'floatingw.png'
theme.layout_fullscreen = system_dir .. 'fullscreenw.png'
theme.layout_tilebottom = system_dir .. 'tilebottomw.png'
theme.layout_tileleft   = system_dir .. 'tileleftw.png'
theme.layout_tiletop    = system_dir .. 'tiletopw.png'
theme.layout_fairv      = system_dir .. 'fairvw.png'
theme.layout_fairh      = system_dir .. 'fairhw.png'
theme.layout_spiral     = system_dir .. 'spiralw.png'
theme.layout_magnifier  = system_dir .. 'magnifierw.png'
theme.layout_cornernw   = system_dir .. 'cornernww.png'
theme.layout_cornerne   = system_dir .. 'cornernew.png'
theme.layout_cornersw   = system_dir .. 'cornersww.png'
theme.layout_cornerse   = system_dir .. 'cornersew.png'


return {
  theme = theme,
}
