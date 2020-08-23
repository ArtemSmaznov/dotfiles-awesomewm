---------------------------------------------------------------------------
--- Firefox hotkeys for awful.hotkeys_widget
--
-- @author Jonathan &lt;jonathan@tinypulse.com&gt;
-- @copyright 2017 Jonathan
-- @submodule awful.hotkeys_popup
---------------------------------------------------------------------------

local hotkeys_popup = require("module.hotkeys_popup.widget")
local fire_rule = { class = { "code" } }
for group_name, group_data in pairs({
    ["git"] = { color = "#009F00", rule_any = fire_rule }
}) do
    hotkeys_popup.add_group_rules(group_name, group_data)
end

local bash_keys = {

	["git"] = {{
		modifiers = {},
		keys = {
      ['update-index --skip-worktree'] = 'ignore local changes',
      ['ls-files -v | grep ^S'] = 'list skipped files',
		}
  }}
}

hotkeys_popup.add_hotkeys(bash_keys)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
