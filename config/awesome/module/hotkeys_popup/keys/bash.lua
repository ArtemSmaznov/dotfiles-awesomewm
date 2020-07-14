---------------------------------------------------------------------------
--- Firefox hotkeys for awful.hotkeys_widget
--
-- @author Jonathan &lt;jonathan@tinypulse.com&gt;
-- @copyright 2017 Jonathan
-- @submodule awful.hotkeys_popup
---------------------------------------------------------------------------

local hotkeys_popup = require("module.hotkeys_popup.widget")
local fire_rule = { class = { "Terminator" } }
for group_name, group_data in pairs({
    ["Command Editing Shortcuts"] = { color = "#009F00", rule_any = fire_rule }
}) do
    hotkeys_popup.add_group_rules(group_name, group_data)
end

local bash_keys = {

	["Command Editing Shortcuts"] = {{
		modifiers = { "Ctrl" },
		keys = {
				['k/u'] = 'delete from cursor to start/end of the command line',
				w = 'delete from cursor to start of word',
				y = 'paste word or text that was cut using one of the deletion shortcuts',
				['xx'] = 'move between start of command line and current cursor position (and back again)',
				t = 'swap character under cursor with the previous one'
		}
	}, {
			modifiers = { "Alt" },
			keys = {
					d = 'delete to end of word starting at cursor',
					c = 'capitalize to end of word starting at cursor',
					['u/l'] = 'make upper/lower case from cursor to end of word',
					t = 'swap current word with previous'
			}
	}}

}

hotkeys_popup.add_hotkeys(bash_keys)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
