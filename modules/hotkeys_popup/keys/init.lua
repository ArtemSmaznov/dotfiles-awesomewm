---------------------------------------------------------------------------
--- Additional hotkeys for awful.hotkeys_widget
--
-- @author Yauheni Kirylau &lt;yawghen@gmail.com&gt;
-- @copyright 2014-2015 Yauheni Kirylau
-- @submodule awful.hotkeys_popup
---------------------------------------------------------------------------


local keys = {
  vim 				= require("modules.hotkeys_popup.keys.vim"),
  browser 		= require("modules.hotkeys_popup.keys.browser"),
  tmux 				= require("modules.hotkeys_popup.keys.tmux"),
  qutebrowser = require("modules.hotkeys_popup.keys.qutebrowser"),
	termite 		= require("modules.hotkeys_popup.keys.termite"),
	bash 				= require('modules.hotkeys_popup.keys.bash'),
	git 				= require('modules.hotkeys_popup.keys.git')
}
return keys

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
