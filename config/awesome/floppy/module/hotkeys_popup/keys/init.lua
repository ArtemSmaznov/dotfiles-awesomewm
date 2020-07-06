---------------------------------------------------------------------------
--- Additional hotkeys for awful.hotkeys_widget
--
-- @author Yauheni Kirylau &lt;yawghen@gmail.com&gt;
-- @copyright 2014-2015 Yauheni Kirylau
-- @submodule awful.hotkeys_popup
---------------------------------------------------------------------------


local keys = {
  vim 				= require("module.hotkeys_popup.keys.vim"),
  browser 		= require("module.hotkeys_popup.keys.browser"),
  tmux 				= require("module.hotkeys_popup.keys.tmux"),
  qutebrowser = require("module.hotkeys_popup.keys.qutebrowser"),
	termite 		= require("module.hotkeys_popup.keys.termite"),
	bash 				= require('module.hotkeys_popup.keys.bash')
}
return keys

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
